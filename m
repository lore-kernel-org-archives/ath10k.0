Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1Wjm-0006jK-3r
 for ath10k@lists.infradead.org; Mon, 30 Jun 2014 08:14:55 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Mon, 30 Jun 2014 10:14:20 +0200
Subject: RE : Warning message in bridge mode
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F15C1D7DB@srvexch01.SODIELEC.local>
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <53988C53.6030806@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997908@srvexch01.SODIELEC.local>
 <539A0C06.6050105@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790A@srvexch01.SODIELEC.local>
 <539B2F21.3020609@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790B@srvexch01.SODIELEC.local>
 <539F0393.1090009@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790D@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F10997914@srvexch01.SODIELEC.local>
 <53A89D2E.6010708@candelatech.com>,
 <E37BEAE7-CCA9-4C79-9F24-051E867FC0F6@gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997915@srvexch01.SODIELEC.local>,
 <53A994F7.6090707@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7D5@srvexch01.SODIELEC.local>,
 <53AC2F78.7080307@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7D6@srvexch01.SODIELEC.local>,
 <53AD94DA.3010908@candelatech.com>
In-Reply-To: <53AD94DA.3010908@candelatech.com>
Content-Language: fr-FR
Content-Type: multipart/mixed;
 boundary="_003_EE97821C81277E459BEA5C6384C6F241012F15C1D7DBsrvexch01SO_"
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Bruno Antunes <baantunes@gmail.com>

--_003_EE97821C81277E459BEA5C6384C6F241012F15C1D7DBsrvexch01SO_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>Can you run 'perf top' or similar on your system to see if the kernel is d=
oing more work
>in promisc mode?  Promisc (monitor) mode is going to disable some firmware=
 packet cooking,
>so I think you may end up doing extra work in the driver.

Thanks, I ran "top" on my system and saw the main different was the task "k=
softirqd". I google it and they told that
this can happen when a high speed network card receives a very large number=
 of packets in a short time frame.
Our processor is almost exhausted in both case (only 2 and 5% idle). This m=
ay be reason our rate was limited when=20
doing test too? You can find in the attached file 2 result when I run top o=
n my system :D

NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE




--_003_EE97821C81277E459BEA5C6384C6F241012F15C1D7DBsrvexch01SO_
Content-Type: text/plain; name="top_non_promis.txt"
Content-Description: top_non_promis.txt
Content-Disposition: attachment; filename="top_non_promis.txt"; size=1328;
	creation-date="Mon, 30 Jun 2014 08:13:37 GMT";
	modification-date="Mon, 30 Jun 2014 08:13:37 GMT"
Content-Transfer-Encoding: base64

TWVtOiA2MDgwMEsgdXNlZCwgNDQ2Mjg4SyBmcmVlLCAwSyBzaHJkLCAwSyBidWZmLCAyODg0MEsg
Y2FjaGVkCkNQVTogICAxJSB1c3IgICA2JSBzeXMgICAwJSBuaWMgICA1JSBpZGxlICAgMCUgaW8g
ICAwJSBpcnEgIDg2JSBzaXJxCkxvYWQgYXZlcmFnZTogMS4yMSAwLjkyIDAuODEgMS82NCAxNjE0
NgogIFBJRCAgUFBJRCBVU0VSICAgICBTVEFUICAgVlNaICVNRU0gJUNQVSBDT01NQU5ECiAgICAz
ICAgICAyIHJvb3QgICAgIFJXICAgICAgIDAgICAwJSAgMTQlIFtrc29mdGlycWQvMF0KMTM3MzUg
ICAgIDIgcm9vdCAgICAgU1cgICAgICAgMCAgIDAlICAxMCUgW2t3b3JrZXIvdToxXQogIDg5OSAg
ICAgMSByb290ICAgICBTICAgICAyNTg4ICAgMSUgICAzJSBtb25pdG9yCiAgNzMzICAgNzMxIHJv
b3QgICAgIFMgICAgIDI0OTIgICAwJSAgIDIlIC91c3IvYmluL3ByaW5jaXBhbCAtcHJvZHVjdGlv
bgoxNTcyMyAgIDc1NCByb290ICAgICBSICAgICAyMzg0ICAgMCUgICAxJSB0b3AKICA3NDkgICA3
NDcgcm9vdCAgICAgUyAgICAgMjk4NCAgIDElICAgMSUgL3Vzci9zYmluL2xpZ2h0dHBkIC1EIC1m
IC9ldGMvbGlnaHR0cGQKICA5MDkgICAgIDEgcm9vdCAgICAgUyAgICAgMjE0MCAgIDAlICAgMSUg
amRiCjE4NjM4ICAgICAyIHJvb3QgICAgIFNXICAgICAgIDAgICAwJSAgIDElIFtrd29ya2VyL3U6
MF0KICA3NTYgICAgIDEgcm9vdCAgICAgUyAgICAgMjI2NCAgIDAlICAgMCUgL3NiaW4va2xvZ2Qg
LW4KICA5MTUgICAgIDEgcm9vdCAgICAgUyAgICAgMjEzMiAgIDAlICAgMCUgY29uZnNmdHAKICA3
MjggICA3MjYgcm9vdCAgICAgUyAgICAgMTc3NiAgIDAlICAgMCUgL3Vzci9iaW4vdXBkYXRlIDIK
MTUyOTEgICAgIDIgcm9vdCAgICAgU1cgICAgICAgMCAgIDAlICAgMCUgW2t3b3JrZXIvMDowXQox
NTUzNyAgICAgMSByb290ICAgICBTICAgICA1Mzg0ICAgMSUgICAwJSB3cGFfc3VwcGxpY2FudCAt
RG5sODAyMTEgLWl3bGFuMCAtYyAvZQogIDcyMyAgICAgMSByb290ICAgICBTICAgICAzODAwICAg
MSUgICAwJSB2c2Z0cGQKICA3NTQgICAgIDEgcm9vdCAgICAgUyAgICAgMjM4NCAgIDAlICAgMCUg
LXNoCjE1NTE1ICAgICAxIHJvb3QgICAgIFMgICAgIDIzMTYgICAwJSAgIDAlIGJpcmQgLWMgL2V0
Yy9iaXJkLmNvbmYKICAgIDEgICAgIDAgcm9vdCAgICAgUyAgICAgMjI2NCAgIDAlICAgMCUgaW5p
dAogIDc1NSAgICAgMSByb290ICAgICBTICAgICAyMjY0ICAgMCUgICAwJSAvc2Jpbi9zeXNsb2dk
IC1uIC1tIDAKICA2MjIgICAgIDEgcm9vdCAgICAgUyAgICAgMjI2NCAgIDAlICAgMCUgL3Vzci9z
YmluL2Ryb3BiZWFyCgoKCgo=

--_003_EE97821C81277E459BEA5C6384C6F241012F15C1D7DBsrvexch01SO_
Content-Type: text/plain; name="top_promisc.txt"
Content-Description: top_promisc.txt
Content-Disposition: attachment; filename="top_promisc.txt"; size=1413;
	creation-date="Mon, 30 Jun 2014 08:13:44 GMT";
	modification-date="Mon, 30 Jun 2014 08:13:44 GMT"
Content-Transfer-Encoding: base64

TWVtOiA2MDQ0MEsgdXNlZCwgNDQ2NjQ4SyBmcmVlLCAwSyBzaHJkLCAwSyBidWZmLCAyODgxMksg
Y2FjaGVkCkNQVTogICAxJSB1c3IgICAyJSBzeXMgICAwJSBuaWMgICAyJSBpZGxlICAgMCUgaW8g
ICAwJSBpcnEgIDkyJSBzaXJxCkxvYWQgYXZlcmFnZTogMS44NyAwLjk2IDAuNzUgNS82MyAxMTEw
MQogIFBJRCAgUFBJRCBVU0VSICAgICBTVEFUICAgVlNaICVNRU0gJUNQVSBDT01NQU5ECiAgICAz
ICAgICAyIHJvb3QgICAgIFJXICAgICAgIDAgICAwJSAgNDAlIFtrc29mdGlycWQvMF0KMTg2Mzgg
ICAgIDIgcm9vdCAgICAgUlcgICAgICAgMCAgIDAlICAxNiUgW2t3b3JrZXIvdTowXQogIDc0OSAg
IDc0NyByb290ICAgICBTICAgICAyOTg0ICAgMSUgICA0JSAvdXNyL3NiaW4vbGlnaHR0cGQgLUQg
LWYgL2V0Yy9saWdodHRwZAogIDg5OSAgICAgMSByb290ICAgICBSICAgICAyNTg4ICAgMSUgICA0
JSBtb25pdG9yCiAgMzcyICAgICAyIHJvb3QgICAgIFNXICAgICAgIDAgICAwJSAgIDMlIFtrd29y
a2VyL3U6Ml0KICA5MDkgICAgIDEgcm9vdCAgICAgUyAgICAgMjE0MCAgIDAlICAgMyUgamRiCiAg
NzU2ICAgICAxIHJvb3QgICAgIFMgICAgIDIyNjQgICAwJSAgIDElIC9zYmluL2tsb2dkIC1uCiAg
OTE1ICAgICAxIHJvb3QgICAgIFMgICAgIDIxMzIgICAwJSAgIDElIGNvbmZzZnRwCiAgNzMzICAg
NzMxIHJvb3QgICAgIFMgICAgIDI0OTIgICAwJSAgIDElIC91c3IvYmluL3ByaW5jaXBhbCAtcHJv
ZHVjdGlvbgoxMDI4MiAgIDc1NCByb290ICAgICBSICAgICAyMzg0ICAgMCUgICAwJSB0b3AKICA3
NTUgICAgIDEgcm9vdCAgICAgUyAgICAgMjI2NCAgIDAlICAgMCUgL3NiaW4vc3lzbG9nZCAtbiAt
bSAwCiAgNzI4ICAgNzI2IHJvb3QgICAgIFMgICAgIDE3NzYgICAwJSAgIDAlIC91c3IvYmluL3Vw
ZGF0ZSAyCiA5NzI1ICAgICAxIHJvb3QgICAgIFMgICAgIDUzODQgICAxJSAgIDAlIHdwYV9zdXBw
bGljYW50IC1Ebmw4MDIxMSAtaXdsYW4wIC1iYnIwCiAgNzIzICAgICAxIHJvb3QgICAgIFMgICAg
IDM4MDAgICAxJSAgIDAlIHZzZnRwZAogIDc1NCAgICAgMSByb290ICAgICBTICAgICAyMzg0ICAg
MCUgICAwJSAtc2gKICAgIDEgICAgIDAgcm9vdCAgICAgUyAgICAgMjI2NCAgIDAlICAgMCUgaW5p
dAogIDYyMiAgICAgMSByb290ICAgICBTICAgICAyMjY0ICAgMCUgICAwJSAvdXNyL3NiaW4vZHJv
cGJlYXIKICA3MjYgICAgIDEgcm9vdCAgICAgUyAgICAgMjEzMiAgIDAlICAgMCUgcnVuc3YgL3Zh
ci9zZXJ2aWNlL3VwZGF0ZQogIDczMSAgICAgMSByb290ICAgICBTICAgICAyMTMyICAgMCUgICAw
JSBydW5zdiAvdmFyL3NlcnZpY2UvcHJpbmNpcGFsCiAgNzQ3ICAgICAxIHJvb3QgICAgIFMgICAg
IDIxMzIgICAwJSAgIDAlIHJ1bnN2IC92YXIvc2VydmljZS9saWdodHRwZAoK

--_003_EE97821C81277E459BEA5C6384C6F241012F15C1D7DBsrvexch01SO_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--_003_EE97821C81277E459BEA5C6384C6F241012F15C1D7DBsrvexch01SO_--
