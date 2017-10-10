Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1zub-00040m-Uq
 for ath10k@lists.infradead.org; Tue, 10 Oct 2017 19:09:56 +0000
Received: by mail-wm0-x22b.google.com with SMTP id f4so8163158wme.0
 for <ath10k@lists.infradead.org>; Tue, 10 Oct 2017 12:09:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e99d4daa-fdc2-ce26-8ffb-bd3cf131e87c@candelatech.com>
References: <e99d4daa-fdc2-ce26-8ffb-bd3cf131e87c@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Tue, 10 Oct 2017 12:09:30 -0700
Message-ID: <CAJ-Vmok9rNij_hErSfArrf9A6U8wCaZZWhOEPphCODKnj5Xjog@mail.gmail.com>
Subject: Re: What should setting rate on 'AP' interface mean?
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
To: Ben Greear <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Hi,

IIRC, I think it's the drivers job to determine per-peer fixed rate.



-adrian


On 10 October 2017 at 11:34, Ben Greear <greearb@candelatech.com> wrote:
> I was trying to use 'iw' to set rates on an AP interface, hoping it would
> set tx-rates on all of the stations (peers) to the same thing.
>
> It appears that the ath10k driver will set ratesets on all stations if
> we specify more than one rate, but if we specify a single rate, it does
> not iterate through all stations, and just sets the 'vdev' fixed rate.
>
> So, should the driver somehow attempt to set single rate on all the stations
> when
> using a single rate?
>
> Or, do we need an API to force rates for individual stations (peers) and
> leave
> the driver in the current configuration?
>
> Or is it the firmware's responsibility to set the rate for all peers when
> we set the vdev fixed rate on an AP vdev?
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
