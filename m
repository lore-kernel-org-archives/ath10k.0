Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIjEF-0002Pq-7l
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 18:29:11 +0000
Message-ID: <530E325E.4060503@candelatech.com>
Date: Wed, 26 Feb 2014 10:28:46 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k:  add vdev-id, return code to error codes
References: <1392318562-32440-1-git-send-email-greearb@candelatech.com>
 <87bnya6xey.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87bnya6xey.fsf@kamboji.qca.qualcomm.com>
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

On 02/13/2014 10:06 PM, Kalle Valo wrote:
> greearb@candelatech.com writes:
> 
>> From: Ben Greear <greearb@candelatech.com>
>>
>> When using multiple vdevs (stations, aps, etc), it is
>> nice to be able to associate log messages with specific
>> interfaces.  So, add vdev-id to most logging messages.
>> Add return code as well, where it was missing.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
> 
> I did some changes just to have consistent style for warning messages,
> see my incremental diff patch below. Let me know if you agree with my
> changes, the full patch is in ath-next-test branch.

Hello!

Are you wanting me to send in a revised version of this patch, or
is it fine as previously posted?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
