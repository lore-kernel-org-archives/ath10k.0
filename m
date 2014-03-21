Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR21R-0002ad-SI
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 16:10:18 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fix getting stats from firmware.
References: <1395360324-20433-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQn1B6g19Ks41kzcoVyhYbHAcJGTNAyucmPMupbRAy1SNg@mail.gmail.com>
 <532C6138.7010201@candelatech.com>
Date: Fri, 21 Mar 2014 18:09:48 +0200
In-Reply-To: <532C6138.7010201@candelatech.com> (Ben Greear's message of "Fri, 
 21 Mar 2014 08:56:40 -0700")
Message-ID: <87ior7a5yr.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> On 03/20/2014 11:33 PM, Michal Kazior wrote:
>> On 21 March 2014 01:05,  <greearb@candelatech.com> wrote:
>>> From: Ben Greear <greearb@candelatech.com>
>>>
>>> Make the request command object the right size so that
>>> firmware will not just throw it away.
>>> Tested customized and upstream firmware.
>> 
>> Did you test 636 as well? 636 doesn't seem to support more than just `stats_id`.
>
> The firmware source I have checks in such a way that sending too
> large of a cmd should be fine, only too small of a command packet
> causes it to be ignored.
>
> I do not have the 636 firmware to test against.

The firmare image is here:

https://github.com/kvalo/ath10k-firmware/tree/master/main

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
