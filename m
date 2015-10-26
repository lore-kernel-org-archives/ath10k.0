Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x236.google.com ([2607:f8b0:4002:c07::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqfMq-0008JB-Up
 for ath10k@lists.infradead.org; Mon, 26 Oct 2015 10:51:09 +0000
Received: by yknn9 with SMTP id n9so178799199ykn.0
 for <ath10k@lists.infradead.org>; Mon, 26 Oct 2015 03:50:47 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 26 Oct 2015 18:50:47 +0800
Message-ID: <CAGJdtRAxPKvNZAZK=YMTGd0mJKP=e2gatyofPz-1KpPj_kU5Rw@mail.gmail.com>
Subject: Specific MAC address impact performance
From: Yu-Chieh <jay0607@gmail.com>
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
To: ath10k@lists.infradead.org

Hi,

I am working on IBSS mode by using ath10k. However i met some problem
about the performance issue
First of all, i set up two nodes, A (74:DA:38:19:19:DC) and B
(74:DA:38:06:E1:96) and run iperf.
i can get around 170 Mbps form A to B

Then, i turn on the third node C(74:DA:38:06:E1:BE).
The performance is deteriorated to around 30Mbps.
If i turn off node C, the performance go back to 170 Mbps.

At the same environment and same devices, i jsut change the mac of B
to (74:DA:38:06:E1:B2)
Everything is good.
No matter node c is on or off, the performance always keep on 170Mbps.

Anyone have any idea about this problem?

Jay

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
