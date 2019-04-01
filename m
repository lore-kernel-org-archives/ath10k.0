Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAvsa-000420-Ff
 for ath10k@lists.infradead.org; Mon, 01 Apr 2019 12:17:33 +0000
MIME-Version: 1.0
Date: Mon, 01 Apr 2019 20:17:28 +0800
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: Re: [PATCH] ath10k: remove iteration in wake_tx_queue
In-Reply-To: <fd76296d-e88e-1dbd-b3d2-e9e7edc7f49d@gmail.com>
References: <20190327162906.6010-1-erik.stromdahl@gmail.com>
 <ba7a88e5-10ff-2ec2-feee-6d4adf472833@bowerswilkins.com>
 <fd76296d-e88e-1dbd-b3d2-e9e7edc7f49d@gmail.com>
Message-ID: <07f403379ca955f2867b29d8f6a2e457@codeaurora.org>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless-owner@vger.kernel.org, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Peter Oh <peter.oh@bowerswilkins.com>

On 2019-03-29 15:47, Erik Stromdahl wrote:
> On 3/27/19 6:49 PM, Peter Oh wrote:
>> 
>> 
>> On 03/27/2019 09:29 AM, Erik Stromdahl wrote:
>>> Iterating the TX queue and thereby dequeuing all available packets in 
>>> the
>>> queue could result in performance penalties on some SMP systems.
>>> 
>> Please share the test results and numbers you've run to help others
>> thoughts.
>> 
> 
> I haven't run any tests with ath10k PCIe, but Yibo Zhao had noticed a 
> 10%
> degradation without this patch.
> 
> Yibo:
> Can you provide iperf results etc. that shows the performance gain?

My tests are based on ixchariot with cabled setup(two-core AP system).
WDS mode--10% deviation:
With previous change: UDP DL-1246 Mbps
W/O previous change:  UDP DL-987 Mbps

Normal mode:
With previous change: UDP DL-1380 Mbps
W/O previous change:  UDP DL-1310 Mbps

Also attached the aqm status.

With previous change:

tid ac backlog-bytes backlog-packets new-flows drops marks overlimit 
collisions tx-bytes tx-packets flags
0 2 0 0 5342229 0 0 0 0 3867657029 5342229 0x0(RUN)
1 3 0 0 0 0 0 0 0 0 0 0x0(RUN)
2 3 0 0 0 0 0 0 0 0 0 0x0(RUN)
3 2 0 0 0 0 0 0 0 0 0 0x0(RUN)
4 1 0 0 0 0 0 0 0 0 0 0x0(RUN)
5 1 0 0 0 0 0 0 0 0 0 0x0(RUN)
6 0 0 0 2 0 0 0 0 144 2 0x0(RUN)
7 0 0 0 2 0 0 0 0 282 2 0x0(RUN)
8 2 0 0 0 0 0 0 0 0 0 0x0(RUN)
9 3 0 0 0 0 0 0 0 0 0 0x0(RUN)
10 3 0 0 0 0 0 0 0 0 0 0x0(RUN)
11 2 0 0 0 0 0 0 0 0 0 0x0(RUN)
12 1 0 0 0 0 0 0 0 0 0 0x0(RUN)
13 1 0 0 0 0 0 0 0 0 0 0x0(RUN)
14 0 0 0 0 0 0 0 0 0 0 0x0(RUN)
15 0 0 0 0 0 0 0 0 0 0 0x0(RUN)

we see no difference between tx-packets and new-flows.

W/O previous change:

tid ac backlog-bytes backlog-packets new-flows drops marks overlimit 
collisions tx-bytes tx-packets flags
0 2 0 0 2233059 3 0 9236 12 1159661783 6380867 0x0(RUN)
1 3 0 0 0 0 0 0 0 0 0 0x0(RUN)
2 3 0 0 0 0 0 0 0 0 0 0x0(RUN)
3 2 0 0 0 0 0 0 0 0 0 0x0(RUN)
4 1 0 0 0 0 0 0 0 0 0 0x0(RUN)
5 1 0 0 0 0 0 0 0 0 0 0x0(RUN)
6 0 0 0 1 0 0 0 0 144 2 0x0(RUN)
7 0 0 0 1 0 0 0 0 282 2 0x0(RUN)
8 2 0 0 0 0 0 0 0 0 0 0x0(RUN)
9 3 0 0 0 0 0 0 0 0 0 0x0(RUN)
10 3 0 0 0 0 0 0 0 0 0 0x0(RUN)
11 2 0 0 0 0 0 0 0 0 0 0x0(RUN)
12 1 0 0 0 0 0 0 0 0 0 0x0(RUN)
13 1 0 0 0 0 0 0 0 0 0 0x0(RUN)
14 0 0 0 0 0 0 0 0 0 0 0x0(RUN)
15 0 0 0 0 0 0 0 0 0 0 0x0(RUN)

new-flows are roughly one-third of the total tx-packets.

> 
> --
> Erik

-- 
Yibo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
