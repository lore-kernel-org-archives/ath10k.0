Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VaiqT-0007TF-4X
 for ath10k@lists.infradead.org; Mon, 28 Oct 2013 09:10:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: README for the ath10k firmware repository?
References: <5265A58B.8000403@candelatech.com>
Date: Mon, 28 Oct 2013 11:03:37 +0200
In-Reply-To: <5265A58B.8000403@candelatech.com> (Ben Greear's message of "Mon, 
 21 Oct 2013 15:07:07 -0700")
Message-ID: <87a9htephy.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> I noticed some new firmware images were added to the ath10k firmware
> repository ( https://github.com/kvalo/ath10k-firmware.git).
>
> Could someone that knows add a small README that describes what firmware
> does what?

I added a small readme and wrote a bit more information to the wiki:

https://github.com/kvalo/ath10k-firmware
http://wireless.kernel.org/en/users/Drivers/ath10k/firmware

Do those help?

> For instance, I was thinking that maybe I should rename firmware-2.bin
> to firmware.bin on the host machine in order to use it..but that makes
> my system not boot.

You should not rename the files, except firmware-2.bin-10.1.389 ->
firmware-2.bin.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
