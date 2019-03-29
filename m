Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9mEj-0005xY-EG
 for ath10k@lists.infradead.org; Fri, 29 Mar 2019 07:47:38 +0000
Received: by mail-lf1-x144.google.com with SMTP id g7so758252lfh.10
 for <ath10k@lists.infradead.org>; Fri, 29 Mar 2019 00:47:36 -0700 (PDT)
Subject: Re: [PATCH] ath10k: remove iteration in wake_tx_queue
References: <20190327162906.6010-1-erik.stromdahl@gmail.com>
 <ba7a88e5-10ff-2ec2-feee-6d4adf472833@bowerswilkins.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <fd76296d-e88e-1dbd-b3d2-e9e7edc7f49d@gmail.com>
Date: Fri, 29 Mar 2019 08:47:33 +0100
MIME-Version: 1.0
In-Reply-To: <ba7a88e5-10ff-2ec2-feee-6d4adf472833@bowerswilkins.com>
Content-Language: en-US
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
To: Peter Oh <peter.oh@bowerswilkins.com>, "kvalo@qca.qualcomm.com" <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "yiboz@codeaurora.org" <yiboz@codeaurora.org>



On 3/27/19 6:49 PM, Peter Oh wrote:
> 
> 
> On 03/27/2019 09:29 AM, Erik Stromdahl wrote:
>> Iterating the TX queue and thereby dequeuing all available packets in the
>> queue could result in performance penalties on some SMP systems.
>>
> Please share the test results and numbers you've run to help others
> thoughts.
> 

I haven't run any tests with ath10k PCIe, but Yibo Zhao had noticed a 10%
degradation without this patch.

Yibo:
Can you provide iperf results etc. that shows the performance gain?

--
Erik

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
