Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail114-240.sinamail.sina.com.cn ([218.30.114.240])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eySww-0002JU-QX
 for ath10k@lists.infradead.org; Wed, 21 Mar 2018 01:54:01 +0000
From: "gary" <guohuizou2000@sina.com>
Subject: [ath10k throughput] low throughput in multi-user mode
Date: Wed, 21 Mar 2018 09:44:07 +0800
Message-ID: <072101d3c0b6$1a954f50$4fbfedf0$@sina.com>
MIME-Version: 1.0
Content-Language: zh-cn
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
To: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org


Hi all,
I have run the throughput test on veriwave.(from Ethernet to wireless)
My AP suports 4*4, 11ac, mu-mimo.,wireless chip is QCA9984.
At first, the throughput is about 80Mbps only with 16 users, so I force to
return true in function ath10k_mac_tx_can_push().
As a result, when the user number is 1~16, the udp throughput is about
1.2Gbps ~1.4Gbps.
But when the user number is 32, the udp throughput is only 520Mbps.

So I try to substitute ath10k-firmware.
With firmware 10.4-3.4-0082 and above, the throughput is around 520Mbps.
But with firmware 10.4-3.4-0072, the throughput gets 1.1Gbps.

Do I miss something in configuration?
Any comment is appreciated.

Thanks.





_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
