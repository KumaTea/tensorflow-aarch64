import lxml
import requests
from bs4 import BeautifulSoup
from urllib.parse import quote_plus

whl_dir = '../whl'
rl_file = 'stable.html'
linaro_root = 'https://snapshots.linaro.org'
linaro_snapshots = 'https://snapshots.linaro.org/ldcg/python/tensorflow-manylinux/'


def get_linaro_release():
    wheels_list = []
    versions = {}
    versions_page = requests.get(linaro_snapshots)
    versions_soup = BeautifulSoup(versions_page.text, features="lxml")
    for a_tag in versions_soup.findAll('a'):
        if 'tensorflow' in a_tag['href'] and 'latest' not in a_tag.text:
            versions[a_tag.text] = linaro_root + a_tag['href']
            print('Get version', a_tag.text)

    for version in versions:
        projects = {}
        projects_page = requests.get(versions[version])
        projects_soup = BeautifulSoup(projects_page.text, features="lxml")
        for a_tag in projects_soup.findAll('a'):
            if 'tensorflow' in a_tag['href'] and version in a_tag['href']:
                projects[a_tag.text] = linaro_root + a_tag['href']
                print('  Get project', a_tag.text)

        for project in projects:
            wheels = {}
            wheels_page = requests.get(projects[project])
            wheels_soup = BeautifulSoup(wheels_page.text, features="lxml")
            for a_tag in wheels_soup.findAll('a'):
                if project in a_tag['href']:
                    wheels[a_tag.text] = linaro_root + a_tag['href']
                    print('    Get wheel', a_tag.text)

            for wheel in wheels:
                wheels_list.append({
                    'name': wheel,
                    'url': wheels[wheel]
                })

    return wheels_list


def gen_index():
    html = ''

    rl_list = get_linaro_release()
    rl_html = ''
    for file in rl_list:
        whl_index = '<a href=\"' + file['url'] + '\">' + quote_plus(file['name']) + '</a><br>\n'
        rl_html += whl_index
    html += rl_html

    with open(f'{whl_dir}/{rl_file}', 'w', encoding='utf-8') as html_file:
        html_file.write(html)
