Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1azpOm-0004n8-Ko
 for ath10k@lists.infradead.org; Mon, 09 May 2016 17:55:17 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH v2 5/5] ath10k: Fix deadlock when peer cannot be created.
Date: Mon, 9 May 2016 17:54:47 +0000
Message-ID: <1462816487256.22920@qti.qualcomm.com>
References: <1459545132-11295-1-git-send-email-greearb@candelatech.com>
 <1459545132-11295-5-git-send-email-greearb@candelatech.com>,
 <5730C697.206@candelatech.com>
In-Reply-To: <5730C697.206@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

> On Monday, May 9, 2016 10:49 PM, greearb@candelatech.com wrote:
>> On 04/01/2016 02:12 PM, greearb@candelatech.com wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> We must not attempt to send WMI packets while holding the data-lock,
>> as it may deadlock:
>>
>> BUG: sleeping function called from invalid context at drivers/net/wireless/ath/ath10k/wmi.c:1824
>> in_atomic(): 1, irqs_disabled(): 0, pid: 2878, name: wpa_supplicant
>>
> Kalle:  I notice these 5 patches are not in the latest wireless-testing.
> 
> Are they not acceptable, or???
>
Aah!.. I recently cooked up similar patch for BUG_ON issue. I think this one is stable candidate. no?

-Rajkumar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
