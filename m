Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve6TD-0006H0-JH
 for ath10k@lists.infradead.org; Wed, 06 Nov 2013 17:00:44 +0000
Message-ID: <527A75A6.3020809@candelatech.com>
Date: Wed, 06 Nov 2013 09:00:22 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k:  Fix crash due to tasklet race.
References: <1383082737-20728-1-git-send-email-greearb@candelatech.com>
 <871u2tsmqe.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <871u2tsmqe.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

On 11/06/2013 05:06 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
> 
>> From: Ben Greear <greearb@candelatech.com>
>>
>> The tasklet can run after the rings have been cleaned up,
>> so check for NULL before de-referencing the ring.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
> 
> I'll drop this as Michal's patch has a proper fix for this issue.

Ok, that sounds fine.  I'll rebase when you push his patches and
drop my patch for continued testing.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
