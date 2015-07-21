Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHWDk-0003Jg-Pg
 for ath10k@lists.infradead.org; Tue, 21 Jul 2015 12:00:29 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NRU016HR6NKR860@mailout3.samsung.com> for
 ath10k@lists.infradead.org; Tue, 21 Jul 2015 20:59:44 +0900 (KST)
Date: Tue, 21 Jul 2015 11:59:44 +0000 (GMT)
From: Maninder Singh <maninder1.s@samsung.com>
Subject: Re: [PATCH 1/1] ath10k: fixing wrong initialization of struct channel
MIME-version: 1.0
MIME-version: 1.0
Message-id: <1785807958.195941437479984203.JavaMail.weblogic@epmlwas04a>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: maninder1.s@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, PANKAJ MISHRA <pankaj.m@samsung.com>

>> chandef is initialized with NULL and on the very next line,
>> we are using it to get channel, which is not correct.
>>
>> channel should be initialized after obtaining chandef.
>>
>> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>

>How did you find this bug?

Static anlysis reports this bug like coverity or any other static tool like cppcheck :-

drivers/net/wireless/ath/ath10k/mac.c:839]: (error) Possible null pointer dereference: chandef

Thanks,
Maninder
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
