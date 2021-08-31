import lxml
import requests
from bs4 import BeautifulSoup
from urllib.parse import quote_plus


author = 'KumaTea'
tf = 'tensorflow'
whl_dir = '../whl'
rl_file = 'stable.html'
project = 'tensorflow-aarch64'
linaro_root = 'https://snapshots.linaro.org'
linaro_snapshots = 'https://snapshots.linaro.org/ldcg/python/tensorflow-manylinux/'
gh_rl_api = 'https://api.github.com/repos/{author}/{project}/releases'


def get_gh_rl(author_name, project_name):
    print('Fetching GitHub releases...')
    assets = []
    result_raw = requests.get(gh_rl_api.format(author=author_name, project=project_name)).json()
    for release in result_raw:
        if release['assets']:
            for binary in release['assets']:
                if 'whl' in binary['name']:
                    assets.append({
                        'name': binary['name'],
                        'url': binary['browser_download_url']
                    })
    return assets


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

        for proj in projects:
            wheels = {}
            wheels_page = requests.get(projects[proj])
            wheels_soup = BeautifulSoup(wheels_page.text, features="lxml")
            for a_tag in wheels_soup.findAll('a'):
                if proj in a_tag['href']:
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

    gh_list = get_gh_rl(author, project)
    gh_html = ''
    for file in gh_list:
        whl_index = '<a href=\"' + file['url'] + '\">' + quote_plus(file['name']) + '</a><br>\n'
        gh_html += whl_index
    html += gh_html

    l_list = get_linaro_release()
    l_html = ''
    l_wheels = []
    for file in l_list:
        if file['name'] in l_wheels:
            print('Skipping duplicated', file['name'])
        else:
            whl_index = '<a href=\"' + file['url'] + '\">' + quote_plus(file['name']) + '</a><br>\n'
            l_wheels.append(file['name'])
            l_html += whl_index
    html += l_html

    with open(f'{whl_dir}/{rl_file}', 'w', encoding='utf-8') as html_file:
        html_file.write(html)


def gen_index_cn():
    with open(f'{whl_dir}/{rl_file}', 'r', encoding='utf-8') as html_file:
        html = html_file.read()
    with open(f'{whl_dir}/stable-cn.html', 'w', encoding='utf-8') as html_file:
        html_file.write(html.replace('https://github.com/', 'https://gh.kumatea.workers.dev/https://github.com/'))
