Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8oJ5-0004uQ-Bh
 for ath10k@lists.infradead.org; Wed, 07 Jan 2015 10:57:44 +0000
Message-ID: <54AD103B.40002@qti.qualcomm.com>
Date: Wed, 7 Jan 2015 16:23:47 +0530
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Make HTT fill size configurable
References: <1420432796-10765-1-git-send-email-sujith@msujith.org>
 <CA+BoTQ=HqF0vBj4chXfoY9GKcFBP8Xh37HXo5etDDZ1XCg6O4w@mail.gmail.com>
In-Reply-To: <CA+BoTQ=HqF0vBj4chXfoY9GKcFBP8Xh37HXo5etDDZ1XCg6O4w@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, Sujith Manoharan <sujith@msujith.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On Wednesday 07 January 2015 03:44 PM, Michal Kazior wrote:
> On 5 January 2015 at 05:39, Sujith Manoharan <sujith@msujith.org> wrote:
>> From: Sujith Manoharan <c_manoha@qca.qualcomm.com>
>>
>> The HTT RX ring is replenished with a maximum of 16 buffers,
>> but this might be insufficient when RX traffic is high.
>> Not having enough RX buffers throttles the FW, resulting
>> in low throughput.
>>
>> This patch adds a module parameter to adjust the fill size
>> based on the platform/usage.
>
> I don't think this should be adjustable.

Default value of 16 causes rx ring corruption within 1 hour of stress
testing. Increasing this limit to 1000 solves the issue, not sure what
max value in > 16 and <= 1000 works. This lower value obviously has issues
on some platforms.

Vasanth

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
