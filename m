Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHZuF-0000Pq-SA
 for ath10k@lists.infradead.org; Tue, 21 Jul 2015 15:56:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/1] ath10k: fixing wrong initialization of struct channel
References: <1785807958.195941437479984203.JavaMail.weblogic@epmlwas04a>
Date: Tue, 21 Jul 2015 18:56:05 +0300
In-Reply-To: <1785807958.195941437479984203.JavaMail.weblogic@epmlwas04a>
 (Maninder Singh's message of "Tue, 21 Jul 2015 11:59:44 +0000")
Message-ID: <87bnf5mrmy.fsf@kamboji.qca.qualcomm.com>
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
To: maninder1.s@samsung.com
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, PANKAJ MISHRA <pankaj.m@samsung.com>

Maninder Singh <maninder1.s@samsung.com> writes:

>>> chandef is initialized with NULL and on the very next line,
>>> we are using it to get channel, which is not correct.
>>>
>>> channel should be initialized after obtaining chandef.
>>>
>>> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
>
>>How did you find this bug?
>
> Static anlysis reports this bug like coverity or any other static tool like cppcheck :-
>
> drivers/net/wireless/ath/ath10k/mac.c:839]: (error) Possible null pointer dereference: chandef

Thanks. This is always good to add to the commit log so I did that:

    ath10k: fix wrong initialization of struct channel
    
    chandef is initialized with NULL and on the very next line, we are using it to
    get channel, which is not correct. Channel should be initialized after
    obtaining chandef.
    
    Found by cppcheck:
    
    ath/ath10k/mac.c:839]: (error) Possible null pointer dereference: chandef
    
    Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
