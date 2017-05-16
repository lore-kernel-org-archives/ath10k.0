Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAc4T-0000Xg-4D
 for ath10k@lists.infradead.org; Tue, 16 May 2017 12:59:26 +0000
Received: by mail-wm0-x244.google.com with SMTP id y10so38164528wmh.0
 for <ath10k@lists.infradead.org>; Tue, 16 May 2017 05:59:04 -0700 (PDT)
Subject: Re: Driver support for QCA6174 chip using SDIO interface
References: <CAHNpzpeRE6ha4JA9i4oyJ2BjgJg53FvDpAb1yZccncrmTeiBdQ@mail.gmail.com>
 <8737g45xc7.fsf@kamboji.qca.qualcomm.com>
 <c3814c7d-eed3-dad2-c568-6ce456ee7166@gmail.com>
 <CABy9W5kF8KcTUgk9UOguu1A-N==tMbjVW1gWGeq8pgAN6YREUg@mail.gmail.com>
 <d4b33a7a-1504-585a-312a-c3ba00d5bab9@gmail.com>
 <CAJ-Vmo=FadyRGTmJBR7dEQeQ97CYHg=D3ViLtDR3eNV4j8B8ew@mail.gmail.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <d0ce199d-d661-0687-0321-ddc2339004ba@gmail.com>
Date: Tue, 16 May 2017 14:59:01 +0200
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmo=FadyRGTmJBR7dEQeQ97CYHg=D3ViLtDR3eNV4j8B8ew@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Adrian Chadd <adrian@freebsd.org>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Adrian,

On 2017-05-15 19:50, Adrian Chadd wrote:
> [snip]
>
> hi!
>
> Which driver are you using as a reference for the SDIO/USB side of things?
>
I am using qcacld. This driver can be tricky to get up and running with later
kernels. Below is a qcacld + kernel combo that I have managed to get up and
running with a QCA9377 SDIO board.

qcacld:
https://github.com/erstrom/qcacld-2.0/tree/boundary-LNX.LEH.4.2.2.2-4.5.20.037

kernel:
https://github.com/boundarydevices/linux-imx6/tree/boundary-imx_4.1.15_1.0.0_ga

The kernel is a special version from boundary devices with imx6 patches,
but I have used it successfully with an x86.

The above qcacld version does unfortunately not work that well with the Linksys
WUSB6100M device (also QCA9377 based). I get the same problems as I do with
my own ath10k patches (receiver goes deaf after a few megabytes).

> We have an interest in USB/SDIO support for Rome/Tuffalo in ath10k and
> I'd like to see how I/we could help in kicking this along!
>
Sounds great!
With more people starting to look at this, I think we can get things
up-and-running soon!

>
>
> -adrian
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
