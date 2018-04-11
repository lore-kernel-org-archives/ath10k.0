Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6HW1-0006H4-IJ
 for ath10k@lists.infradead.org; Wed, 11 Apr 2018 15:18:31 +0000
Received: by mail-wr0-x229.google.com with SMTP id s12so2157433wrc.8
 for <ath10k@lists.infradead.org>; Wed, 11 Apr 2018 08:18:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <044ffe4d-4c50-4aeb-392c-aea9a813ebb4@candelatech.com>
References: <044ffe4d-4c50-4aeb-392c-aea9a813ebb4@candelatech.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 11 Apr 2018 08:18:15 -0700
Message-ID: <CAJ+vNU1MSa3iR7dAW6M+TiKutzyYSeT3p4H0J8L_W3mTTEtyzQ@mail.gmail.com>
Subject: Re: Please add new board files for WLE1216V5-20 and another Compex
 NIC.
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
To: Ben Greear <greearb@candelatech.com>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>
Cc: ath10k <ath10k@lists.infradead.org>

On Wed, Mar 21, 2018 at 2:59 PM, Ben Greear <greearb@candelatech.com> wrote:
> Hello,
>
> It seems the upstream board-2.bin file for 9984 does not yet include support
> for WLE1216V5-20
> (or possibly it does and OpenWRT grabs the wrong one?).
>
> I'm attaching the board file for this NIC and for another one which
> I have not yet tested.  I received these from Compex and have
> tested the bus=pci,bmi-chip-id=0,bmi-board-id=31-compex.bin file on the
> WLE1216V5-20
>
> Please add these into the official board-2.bin for 9984.
>

Kalle,

Any progress on this? I believe your the one that has to update the
board-2.bin at https://github.com/kvalo/ath10k-firmware/commits/master/QCA9984/hw1.0.

It's not clear what the process is for getting new board id's
supported in the board.bin files.

Regards,

Tim

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
