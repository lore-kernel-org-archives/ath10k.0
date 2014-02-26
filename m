Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIie0-0000mg-J1
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 17:51:45 +0000
Message-ID: <530E2999.6000901@candelatech.com>
Date: Wed, 26 Feb 2014 09:51:21 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k:  make TARGET_NUM_PEERS match WMI_MAX_KEY_INDEX.
References: <1392742567-6134-1-git-send-email-greearb@candelatech.com>
 <87r46plt07.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87r46plt07.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 02/26/2014 08:48 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
> 
>> From: Ben Greear <greearb@candelatech.com>
>>
>> This appears to fix the problem of running out of keys
>> in the firmware.  Possibly it only hides the problem,
>> however.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
> 
> IIRC you asked me to drop this patch in other thread. I have now done
> that.

Yes, it breaks upstream firmware (looks like it asserts, but not sure exactly
why).

I still think it might be a problem, but it would take someone with newer
firmware source and/or better understanding of how the keys are supposed
to work to know for sure.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
