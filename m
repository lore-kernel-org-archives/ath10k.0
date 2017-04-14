Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cz9Lq-0001bz-Py
 for ath10k@lists.infradead.org; Fri, 14 Apr 2017 22:06:01 +0000
Received: by mail-wr0-x229.google.com with SMTP id o21so56433565wrb.2
 for <ath10k@lists.infradead.org>; Fri, 14 Apr 2017 15:05:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170414152224.5880713a@blackhole.sk>
References: <20170414152224.5880713a@blackhole.sk>
From: Adrian Chadd <adrian@freebsd.org>
Date: Fri, 14 Apr 2017 15:05:35 -0700
Message-ID: <CAJ-Vmompsw2z_m+9Tjmn2_Q+0esuBM0yWb96oqD2xZ-D0NY6rg@mail.gmail.com>
Subject: Re: ThinkPad X201/X230 and COMPEX WLE900VX-7A wifi module
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
To: Marek Behun <kabel@blackhole.sk>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hiya,

I think there's a known issue with the compex NIC not being "will work
on all mini-pcie slots" for some reason. I don't know why :(



-adrian


On 14 April 2017 at 06:22, Marek Behun <kabel@blackhole.sk> wrote:
> Hello,
> I have a question about the MiniPCI-e wifi module COMPEX WLE900VX-7A.
> This module can be found in, for example, the Turris Omnia router, or
> can be bought from CompexShop
> http://www.compexshop.com/product_info.php/cPath/104_105/products_id/452
>
> On the webpage you can find this text:
>   Attention : Atheros 11ac radio can't be used in PC or laptop, as BIOS
>   do not detects it, as Atheros do not release such driver. Pls read
>   reviews for more details about supported PC boards
>
>   We found that with our Linux PC the WLE600VX card radio (using
>   miniPCIe to PCIe adapter card) is working well.
>
> So apparently somehow this module work on some machines and on others
> don't. I have tried in Lenovo 3000 N200 notebook, and lspci sees the
> device. But when I tried on ThinkPad X201/X230 (flashed with coreboot,
> so the wifi-card whitelist in original BIOS cannot be the problem
> here), the card won't show on lspci. I have a different ath10k card
> (half sized, from another notebook), and this card works.
>
> Is it really possible that some support needs to be directly in BIOS
> (coreboot in this case) for this card to appear on lspci on X230? Or
> can the reason be that, for example, the MiniPCI-e WLAN slot on
> X201/X230 is somehow special and cannot handle this module?
>
> I am perplexed a little as to what should there be in the bios, since
> there is nothing special in u-boot nor in Linux kernel of the Turris
> Omnia router.
>
> I have also been thinking about creating a ExpressCard-to-MiniPCI-e
> reduction (this can be totally passive, I found out). Is it possible
> that the card will be recognized through such a reduction in the
> ExpressCard slot on the ThinkPads?
>
> Thank you.
>
> Marek
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
