Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.com ([74.208.4.200])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWRVt-0002YA-Jc
 for ath10k@lists.infradead.org; Fri, 13 Mar 2015 15:28:38 +0000
MIME-Version: 1.0
Message-ID: <trinity-2097dd2e-b8b3-40c5-9eed-c0dc7d8690af-1426260485155@3capp-mailcom-lxa11>
From: "Jason H" <jhihn@gmx.com>
Subject: Re: QCA6174 hw2.1?
Date: Fri, 13 Mar 2015 16:28:05 +0100
In-Reply-To: <CA+BoTQnGQC9sy_Qhiv4peeRsF2dY+2yd12GTgJpyRhrgMTg+Yw@mail.gmail.com>
References: <trinity-d51578c9-4e28-4805-b58e-fdd5388949da-1426217948333@msvc-mesg-gmx002>,
 <CA+BoTQnGQC9sy_Qhiv4peeRsF2dY+2yd12GTgJpyRhrgMTg+Yw@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>


> On 13 March 2015 at 04:39,  <jhihn@gmx.com> wrote:
> > I went through the archives, and the  wiki but I still wasn't sure...
> > I have a shiny new Lenovo z70, kernel 4.0-rc1/3.  Dmesg reports failures for loading  firmware in /lib/firmware/ath10k/QCA6174/hw2.1/...
> > So I found the firmware Git repo,  but it seems to be missing hw2.1. I even symlinked 2.1 to  3.0, no dice.
> 
> You can't use hw3 firmware for hw2 hardware.
> 
> The problem is there's no publicly available ath10k firmware for hw2 hardware..
> 
> 
> > I don't dual boot and this is a laptop  so I'm looking to get  my WiFi working.  Any pointers are appreciated.  Thanks.
> 
> You could try building hw2 firmware ath10k binary yourself. You need
> to fetch athwlan.bin from Windows driver, extract otp image from hw3
> firmware ath10k binary and then re-assemble both into hw3 firmware for
> ath10k. The ath10k binary blob is a tag-length-value format and can be
> understood by looking at ath10k_core_fetch_firmware_api_n().
> 
> Nobody seems to have tried this yet though.


I installed WINE and attempted to install the driver from lenono on my non-lenovo with working wifi. The install failed (expected) but not before it extracted the actual driver installer images (expected). Parsing through an .inf file, and navigating my way through the sections, I end up at a section specifying eeprom_ar6320_2p1_NFA354xp.bin and qca61x420.bin as the firmware files. I have these files.

However I am now diverging from your instructions considerably. Also I don't know why I would want to reassemble into 3.0 when my system is looking for 2.1? I don't know what an 'otp image' is? I think I understand the part about the ath10k format though.

Could you update your instructions to suit the new information at hand? 


Thanks again


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
