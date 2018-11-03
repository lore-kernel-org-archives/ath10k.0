Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJ2HB-00039l-BY
 for ath10k@lists.infradead.org; Sat, 03 Nov 2018 20:12:10 +0000
Received: by mail-lf1-x143.google.com with SMTP id p17so3533087lfh.4
 for <ath10k@lists.infradead.org>; Sat, 03 Nov 2018 13:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAEJqkgiKzYTZQTGWNAPTeOPFWz658FWqDsAhyoxVDP1VKWSukg@mail.gmail.com>
In-Reply-To: <CAEJqkgiKzYTZQTGWNAPTeOPFWz658FWqDsAhyoxVDP1VKWSukg@mail.gmail.com>
From: Gabriel C <nix.or.die@gmail.com>
Date: Sat, 3 Nov 2018 21:11:31 +0100
Message-ID: <CAEJqkgh7xksO7tmPHGkOXvWftc2AcCgi4j3S3C88CorV53+Hgw@mail.gmail.com>
Subject: Re: atk10k Unknown eventid and WARN() on resume with kernel 4.19
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org, dex77@frugalware.org

Am Sa., 3. Nov. 2018 um 21:01 Uhr schrieb Gabriel C <nix.or.die@gmail.com>:
>
> Hello,
>
> starting with kernel 4.19 we noticed  'Unknown eventid: xxxx' warnings
> on our Laptops.
>
> ...
>
> crazy@devnull:~$ dmesg | grep Unknow
> [    7.144998] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
> [    7.147758] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
> [    9.441654] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
> [    9.444446] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
> [   11.770997] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
> [   11.773787] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
> [320339.374108] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
> [320339.377020] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
> [320342.128664] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
> [320342.131447] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
> [320344.452864] ath10k_pci 0000:03:00.0: Unknown eventid: 118809
> [320344.455696] ath10k_pci 0000:03:00.0: Unknown eventid: 90118
>
> ....
>
> Both boxes also hits the following WARN*() on resume from S3:
>
 Uh sorry .. Gmail doesn't like long lines it seems.
There the WARN() message:

http://ftp.frugalware.org/pub/other/people/crazy/warn.txt

>
> Please let me know if you need an dmesg or any other informations.
>
> BR ,
>
> Gabriel C.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
