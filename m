Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJ1ur-0007qT-7m
 for ath10k@lists.infradead.org; Wed, 04 Feb 2015 15:30:57 +0000
Message-ID: <54D23B64.3060806@candelatech.com>
Date: Wed, 04 Feb 2015 07:31:48 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/8] ath10k: scan should handle scan-start-failed event
 properly.
References: <1421087564-10384-1-git-send-email-greearb@candelatech.com>
 <878ugeul6u.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <878ugeul6u.fsf@kamboji.qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 02/04/2015 12:37 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:
>
>> From: Ben Greear <greearb@candelatech.com>
>>
>> In case firmware fails to start the scan, then complete
>> the start condition and clean up so that driver does not
>> block on timeout.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>
> These patches are now in the pending branch.
>
> 86f50c71b224 ath10k: scan should handle scan-start-failed event properly
> c6dde373a4bb ath10k: fix spelling mistakes and add details to mac logging
> 198c0184d94c ath10k: fix spelling in htt code comment
> 227822d52d26 ath10k: fix CE_DESC_FLAGS_META_DATA_LSB definition
>
> I dropped the rest as I really would like to avoid maintaining yet
> another firmware branch.


Thanks for applying those.

I'll stop sending patches related to my firmware.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
