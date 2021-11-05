# https://www.tensorflow.org/tutorials/quickstart/beginner

import tensorflow as tf


# Print TensorFlow version
print('TensorFlow version:', tf.__version__)
if tf.__version__.startswith('1'):
    tf.compat.v1.enable_eager_execution()


def mnist_test():
    mnist = tf.keras.datasets.mnist

    (x_train, y_train), (x_test, y_test) = mnist.load_data()
    x_train, x_test = x_train / 255.0, x_test / 255.0

    model = tf.keras.models.Sequential([
      tf.keras.layers.Flatten(input_shape=(28, 28)),
      tf.keras.layers.Dense(128, activation='relu'),
      tf.keras.layers.Dropout(0.2),
      tf.keras.layers.Dense(10)
    ])

    predictions = model(x_train[:1]).numpy()

    tf.nn.softmax(predictions).numpy()

    loss_fn = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)
    loss_fn(y_train[:1], predictions).numpy()

    model.compile(optimizer='adam',
                  loss=loss_fn,
                  metrics=['accuracy'])

    model.fit(x_train, y_train, epochs=5)

    model.evaluate(x_test,  y_test, verbose=2)

    probability_model = tf.keras.Sequential([
      model,
      tf.keras.layers.Softmax()
    ])

    probability_model(x_test[:5])


if __name__ == '__main__':
    try:
        mnist_test()
    except Exception as e:
        print('Error:', e)
