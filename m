Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-ams-01.qualcomm.com ([185.23.61.162])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f96Nx-0006eB-J0
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 10:01:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Please add new board files for WLE1216V5-20 and another Compex
 NIC.
Date: Thu, 19 Apr 2018 10:01:29 +0000
Message-ID: <87fu3rms5k.fsf@kamboji.qca.qualcomm.com>
References: <044ffe4d-4c50-4aeb-392c-aea9a813ebb4@candelatech.com>
In-Reply-To: <044ffe4d-4c50-4aeb-392c-aea9a813ebb4@candelatech.com> (Ben
 Greear's message of "Wed, 21 Mar 2018 14:59:33 -0700")
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> It seems the upstream board-2.bin file for 9984 does not yet include
> support for WLE1216V5-20
> (or possibly it does and OpenWRT grabs the wrong one?).
>
> I'm attaching the board file for this NIC and for another one which
> I have not yet tested.  I received these from Compex and have
> tested the bus=pci,bmi-chip-id=0,bmi-board-id=31-compex.bin file on the WLE1216V5-20
>
> Please add these into the official board-2.bin for 9984.

Added, but please check carefully that I didn't do any mistakes.

https://github.com/kvalo/ath10k-firmware/commit/66be3a48d9cf17ace8413cf478a5954483393af4

New:
bus=pci,bmi-chip-id=0,bmi-board-id=30

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 11 in total

New:
bus=pci,bmi-chip-id=0,bmi-board-id=31

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 12 in total

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
