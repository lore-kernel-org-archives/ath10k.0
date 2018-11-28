Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gS1ak-00061J-MF
 for ath10k@lists.infradead.org; Wed, 28 Nov 2018 15:17:32 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: missing firmware in debian 9
References: <20181116133851.czjhgfmttodnudzg@adell35>
 <6892054.LxBMB1ZCDT@bentobox>
 <87h8g170zl.fsf@kamboji.qca.qualcomm.com>
 <1543415108.3687532.1591824912.00271098@webmail.messagingengine.com>
Date: Wed, 28 Nov 2018 17:17:15 +0200
In-Reply-To: <1543415108.3687532.1591824912.00271098@webmail.messagingengine.com>
 (Anil Duggirala's message of "Wed, 28 Nov 2018 09:25:08 -0500")
Message-ID: <87d0qp6xl0.fsf@kamboji.qca.qualcomm.com>
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
To: Anil Duggirala <anilduggirala@fastmail.fm>
Cc: debian-kernel@lists.debian.org, ath10k@lists.infradead.org, Sven Eckelmann <sven.eckelmann@openmesh.com>

Anil Duggirala <anilduggirala@fastmail.fm> writes:

>> > I don't have a QCA6174 hw3.0 but I would guess that ath10k loaded the
>> > firmware-4.bin after it failed to load the firmware-5.bin.
>
> How can I make sure this is the case?

ath10k prints lots of information to dmesg after it has initialised the
device, so check that. You should see the firmware version and what api
is used (the number N from firmware-N.bin).

> I have had a couple of issues with my bluetooth, how can I test it?

The warnings you posted are because ath10k is trying to find optional
calibration data and various firmware versions of firmware file from
user space. The warnings and commit c8e028026387 have nothing to do with
bluetooth, so that must be a separate issue.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
