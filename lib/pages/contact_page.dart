import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool isHover = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Vamos conversar sobre seu projeto?',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(69, 117, 116, 1),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            'Entre em contato!',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu nome';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu email';
                          } else if (!value.contains('@')) {
                            return 'Por favor, insira um email válido';
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua mensagem';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Mensagem',
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        maxLines: 4,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AnimatedSnackBar.material(
                              'Sua mensagem foi enviada com sucesso, entrarei em contato em breve!',
                              type: AnimatedSnackBarType.success,
                              mobileSnackBarPosition:
                                  MobileSnackBarPosition.bottom,
                              desktopSnackBarPosition:
                                  DesktopSnackBarPosition.bottomCenter,
                            ).show(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(69, 117, 116, 1),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Enviar Mensagem',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Row(
                        children: [
                          Icon(FontAwesomeIcons.envelope),
                          SizedBox(width: 16),
                          SelectableText('danubioalves@gmail.com'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Icon(FontAwesomeIcons.whatsapp),
                          SizedBox(width: 16),
                          SelectableText('+55 88 98155-1948'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(FontAwesomeIcons.linkedin),
                          const SizedBox(width: 16),
                          InkWell(
                            child: HoverWidget(
                              hoverChild: const Text(
                                'LinkedIn',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                ),
                              ),
                              onHover: (_) {
                                setState(() {
                                  isHover = true;
                                });
                              },
                              child: const Text('LinkedIn',
                                  style: TextStyle(
                                      color: Color.fromRGBO(69, 117, 116, 1),
                                      fontWeight: FontWeight.bold)),
                            ),
                            onTap: () async {
                              const url =
                                  'https://www.linkedin.com/in/danubio-leite/';
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              } else {
                                throw 'Could not  launch $url';
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(FontAwesomeIcons.user),
                          const SizedBox(width: 16),
                          InkWell(
                            child: HoverWidget(
                              hoverChild: const Text(
                                '99 Freelas',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                ),
                              ),
                              onHover: (_) {
                                setState(() {
                                  isHover = true;
                                });
                              },
                              child: const Text('99 Freelas',
                                  style: TextStyle(
                                      color: Color.fromRGBO(69, 117, 116, 1),
                                      fontWeight: FontWeight.bold)),
                            ),
                            onTap: () async {
                              const url =
                                  'https://www.99freelas.com.br/user/JDanubio';
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              } else {
                                throw 'Could not  launch $url';
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
