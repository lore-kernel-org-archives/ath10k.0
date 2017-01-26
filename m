Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWXkZ-0002ON-O2
 for ath10k@lists.infradead.org; Thu, 26 Jan 2017 00:17:17 +0000
Received: by mail-wm0-f49.google.com with SMTP id r126so50326384wmr.0
 for <ath10k@lists.infradead.org>; Wed, 25 Jan 2017 16:16:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <BLUPR06MB868447C715B572A777EB7ABE0770@BLUPR06MB868.namprd06.prod.outlook.com>
References: <BLUPR06MB868ABBAAB6D6107EECB885FE0740@BLUPR06MB868.namprd06.prod.outlook.com>
 <BLUPR06MB8682BCD53C888879F9B4E68E0740@BLUPR06MB868.namprd06.prod.outlook.com>
 <CAJ-Vmokm1ZYJUfEcwvg49Q3v=G6c=TVnfSsAn-+BgcPHZ+muOg@mail.gmail.com>
 <BLUPR06MB86859F97513770F64B72784E0770@BLUPR06MB868.namprd06.prod.outlook.com>
 <BLUPR06MB868447C715B572A777EB7ABE0770@BLUPR06MB868.namprd06.prod.outlook.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Wed, 25 Jan 2017 16:15:52 -0800
Message-ID: <CAJ-VmonSzmo_2QaKccxUoTWTHXiK_MN4_JWYv5r-GFsQXY4sAQ@mail.gmail.com>
Subject: Re: ath10k + OpenWRT + ath10k firmware 10.2.2.60.14 - Crash
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kevin Dious <Kevin.Dious@ubiqomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

https://wireless.wiki.kernel.org/en/users/Drivers/ath10k/debug should help!



-adrian


On 25 January 2017 at 16:10, Kevin Dious <Kevin.Dious@ubiqomm.com> wrote:
> Adrian,
>
>
>
>
>
> Thanks for the prompt reply.
>
> How exactly do I enable WMI/MAC debugging?  I am a little new to this with ath10k.  Is this the correct way to do it (use the -d flag when running the firmware encoder script)?  Just want to be sure.
>
> kevin@kevin-XPS-8700:~/compex_board_build/qca-swiss-army-knife/tools/scripts/ath10k$ python ath10k-fwencoder -c --otp otp.bin --firmware athwlan.bin --set-fw-api 3 --set-wmi-op-version 10.2 --set-htt-op-version unset -d
> DEBUG: adding id 1 len(value) 4padding_len 0
> DEBUG: adding id 4 len(value) 6869padding_len 3
> DEBUG: adding id 3 len(value) 224758padding_len 2
> DEBUG: adding id 5 len(value) 4padding_len 0
> firmware-3.bin created: 231684 B
> kevin@kevin-XPS-8700:~/compex_board_build/qca-swiss-army-knife/tools/scripts/ath10k$
>
>
> Thank you.
>
> Kevin
>
> From: adrian.chadd@gmail.com <adrian.chadd@gmail.com> on behalf of Adrian Chadd <adrian@freebsd.org>
> Sent: Wednesday, January 25, 2017 4:05:05 PM
> To: Kevin Dious
> Cc: ath10k@lists.infradead.org
> Subject: Re: ath10k + OpenWRT + ath10k firmware 10.2.2.60.14 - Crash
>
> Hiya,
>
> Can you enable WMI/MAC debugging when you load it up? Knowing which
> command(s) it's sent before it does would be helpful.
>
> It'd also be useful to know if it's something silly, like it thinking
> it's a 2G device when QCA9888 is definitely 5G...
>
>
> -a
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
