Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr40068.outbound.protection.outlook.com ([40.107.4.68]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9Cg2-0005t2-4p
 for ath10k@lists.infradead.org; Wed, 27 Mar 2019 17:49:27 +0000
From: Peter Oh <peter.oh@bowerswilkins.com>
Subject: Re: [PATCH] ath10k: remove iteration in wake_tx_queue
Date: Wed, 27 Mar 2019 17:49:19 +0000
Message-ID: <ba7a88e5-10ff-2ec2-feee-6d4adf472833@bowerswilkins.com>
References: <20190327162906.6010-1-erik.stromdahl@gmail.com>
In-Reply-To: <20190327162906.6010-1-erik.stromdahl@gmail.com>
Content-Language: en-US
Content-ID: <414874B7A6CBEB44BDDF7738076C1529@eurprd04.prod.outlook.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>, "kvalo@qca.qualcomm.com" <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "yiboz@codeaurora.org" <yiboz@codeaurora.org>



On 03/27/2019 09:29 AM, Erik Stromdahl wrote:
> Iterating the TX queue and thereby dequeuing all available packets in the
> queue could result in performance penalties on some SMP systems.
>
Please share the test results and numbers you've run to help others 
thoughts.

Thanks,
Peter
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
