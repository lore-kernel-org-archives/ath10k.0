Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-co1nam03on0139.outbound.protection.outlook.com
 ([104.47.40.139] helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWXec-0000aq-T8
 for ath10k@lists.infradead.org; Thu, 26 Jan 2017 00:11:08 +0000
From: Kevin Dious <Kevin.Dious@ubiqomm.com>
Subject: Re: ath10k + OpenWRT + ath10k firmware 10.2.2.60.14 - Crash
Date: Thu, 26 Jan 2017 00:10:42 +0000
Message-ID: <BLUPR06MB868447C715B572A777EB7ABE0770@BLUPR06MB868.namprd06.prod.outlook.com>
References: <BLUPR06MB868ABBAAB6D6107EECB885FE0740@BLUPR06MB868.namprd06.prod.outlook.com>
 <BLUPR06MB8682BCD53C888879F9B4E68E0740@BLUPR06MB868.namprd06.prod.outlook.com>,
 <CAJ-Vmokm1ZYJUfEcwvg49Q3v=G6c=TVnfSsAn-+BgcPHZ+muOg@mail.gmail.com>,
 <BLUPR06MB86859F97513770F64B72784E0770@BLUPR06MB868.namprd06.prod.outlook.com>
In-Reply-To: <BLUPR06MB86859F97513770F64B72784E0770@BLUPR06MB868.namprd06.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Adrian Chadd <adrian@freebsd.org>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Adrian,





Thanks for the prompt reply.

How exactly do I enable WMI/MAC debugging? =A0I am a little new to this wit=
h ath10k. =A0Is this the correct way to do it (use the -d flag when running=
 the firmware encoder script)? =A0Just want to be sure.

kevin@kevin-XPS-8700:~/compex_board_build/qca-swiss-army-knife/tools/script=
s/ath10k$ python ath10k-fwencoder -c --otp otp.bin --firmware athwlan.bin -=
-set-fw-api 3 --set-wmi-op-version 10.2 --set-htt-op-version unset -d
DEBUG: adding id 1 len(value) 4padding_len 0
DEBUG: adding id 4 len(value) 6869padding_len 3
DEBUG: adding id 3 len(value) 224758padding_len 2
DEBUG: adding id 5 len(value) 4padding_len 0
firmware-3.bin created: 231684 B
kevin@kevin-XPS-8700:~/compex_board_build/qca-swiss-army-knife/tools/script=
s/ath10k$


Thank you.

Kevin
  =

From: adrian.chadd@gmail.com <adrian.chadd@gmail.com> on behalf of Adrian C=
hadd <adrian@freebsd.org>
Sent: Wednesday, January 25, 2017 4:05:05 PM
To: Kevin Dious
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k + OpenWRT + ath10k firmware 10.2.2.60.14 - Crash
=A0   =

Hiya,

Can you enable WMI/MAC debugging when you load it up? Knowing which
command(s) it's sent before it does would be helpful.

It'd also be useful to know if it's something silly, like it thinking
it's a 2G device when QCA9888 is definitely 5G...


-a
    =

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
