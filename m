Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qa0-x229.google.com ([2607:f8b0:400d:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X3byi-00018E-IG
 for ath10k@lists.infradead.org; Sun, 06 Jul 2014 02:14:57 +0000
Received: by mail-qa0-f41.google.com with SMTP id cm18so2495668qab.0
 for <ath10k@lists.infradead.org>; Sat, 05 Jul 2014 19:14:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53B808BF.8070000@candelatech.com>
References: <53B808BF.8070000@candelatech.com>
Date: Sat, 5 Jul 2014 19:14:34 -0700
Message-ID: <CAJ-Vmo=8pO0eVpL5L28AVALn+rpYPxhOw5kYkaGieBt-RzN3iQ@mail.gmail.com>
Subject: Re: Question on beacon-miss handling.
From: Adrian Chadd <adrian@freebsd.org>
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
Cc: ath10k <ath10k@lists.infradead.org>

Where is it in the firmware again?

The beacon miss stuff is a little .. odd. Mostly because there's only
one (and maybe two) timers for it and they're a pain in the ass to
configure correctly. Having it scale (correctly) to more than two
vdevs may be a little challenging.



-a


On 5 July 2014 07:16, Ben Greear <greearb@candelatech.com> wrote:
> While poking around in the firmware, I notice that ath10k
> driver only requests a few vdevs to be supported by
> the beacon-miss firmware logic, though the driver
> supposedly supports more vdevs than that...
>
> Any idea how this is supposed to work with more vdevs
> than bmiss_offload_max_vdev?
>
> Maybe it is best to just disable beacon-miss logic in
> firmware entirely and let the driver/host handle it?
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
