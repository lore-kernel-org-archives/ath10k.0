Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWe2d-0000I8-Fo
 for ath10k@lists.infradead.org; Tue, 01 Sep 2015 05:23:32 +0000
Subject: Re: [PATCH] ath10k: Drop probe responses when too many are queued
References: <1441019095-2364-1-git-send-email-nataraja@qti.qualcomm.com>
 <55E48151.9080609@candelatech.com>
From: "Natarajan, Vivekanandan" <nataraja@qti.qualcomm.com>
Message-ID: <55E53619.5080402@qti.qualcomm.com>
Date: Tue, 1 Sep 2015 10:52:33 +0530
MIME-Version: 1.0
In-Reply-To: <55E48151.9080609@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, kvalo@qca.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 8/31/2015 10:01 PM, Ben Greear wrote:
>
>
> On 08/31/2015 04:04 AM, Vivek Natarajan wrote:
>> In a noisy environment, when multiple interfaces are created,
>> the management tx descriptors are fully occupied by the probe
>> responses from all the interfaces. This prevents a new station
>> from a successful association.
>>
>> Fix this by limiting the probe responses when the specified
>> threshold limit is reached.
>
> Is this useful when firmware supports management-tx over HTT (instead 
> of WMI)?

Yes, it is applicable for HTT path.  The mgmt frames through the HTT 
path use the tx descriptors in the firmware. This patch just prevents 
its overuse by probe response frames.

Vivek.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
