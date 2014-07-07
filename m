Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X42sG-0004jb-LS
 for ath10k@lists.infradead.org; Mon, 07 Jul 2014 06:58:05 +0000
Received: by mail-wi0-f178.google.com with SMTP id n15so6116591wiw.17
 for <ath10k@lists.infradead.org>; Sun, 06 Jul 2014 23:57:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <21434.5649.615843.633424@gargle.gargle.HOWL>
References: <53B808BF.8070000@candelatech.com>
 <CAJ-Vmo=8pO0eVpL5L28AVALn+rpYPxhOw5kYkaGieBt-RzN3iQ@mail.gmail.com>
 <53B8C4DF.5000308@candelatech.com>
 <CAJ-Vmo=tjqCAns3N2_PY08r6A85Q9e8CoSWCV7g5KCQHRmqN-g@mail.gmail.com>
 <21432.58953.39322.640936@gargle.gargle.HOWL>
 <53B90EB1.8020305@candelatech.com>
 <21434.5649.615843.633424@gargle.gargle.HOWL>
Date: Mon, 7 Jul 2014 08:57:37 +0200
Message-ID: <CACKGw+FN5R_FQmEFHG4HrazXzV-b+QiG=DnOrOmWBFvapFk0hw@mail.gmail.com>
Subject: Re: Question on beacon-miss handling.
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: Ben Greear <greearb@candelatech.com>, Adrian Chadd <adrian@freebsd.org>, ath10k <ath10k@lists.infradead.org>

On 7 July 2014 05:37, Sujith Manoharan <sujith@msujith.org> wrote:
> Ben Greear wrote:
>> Maybe the driver should make this 0 instead of 2 then?
>> hw.h:#define TARGET_10X_BMISS_OFFLOAD_MAX_VDEV        2
>> That would save resources in the firmware.
>
> Yes, it would. ath10k doesn't seem to be handling roam
> events too, so maybe that can be set to 0 - not sure if
> there are plans to properly enable and use roaming functionality
> that is already in the firmware.

That is correct. ath10k does not currently support hw/fw conn
monitoring. Things may change in future as we upgrade to support 10.2
firmware, but AFAIK there's no direct plan to use this offloads. And
regarding the initialization of BMISS/ROAM_OFFLOADs, yes looks like
this can be erased to save some firmware memory.

-Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
