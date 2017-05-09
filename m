Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway36.websitewelcome.com ([50.116.124.69])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d83pC-0003Wg-H4
 for ath10k@lists.infradead.org; Tue, 09 May 2017 12:01:09 +0000
Received: from cm5.websitewelcome.com (cm5.websitewelcome.com [108.167.139.22])
 by gateway36.websitewelcome.com (Postfix) with ESMTP id D89C240122165
 for <ath10k@lists.infradead.org>; Tue,  9 May 2017 07:00:41 -0500 (CDT)
Date: Tue, 09 May 2017 07:00:40 -0500
Message-ID: <20170509070040.Horde.6Ij5mVFBAtwRRwxv1IUZfj_@gator4166.hostgator.com>
From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: Re: [PATCH] net: wireless: ath: ath10k: remove unnecessary code
References: <20170509042159.GA19727@embeddedgus>
 <87lgq6387s.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87lgq6387s.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="Yes"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Hi Kalle,

Quoting Kalle Valo <kvalo@qca.qualcomm.com>:

> "Gustavo A. R. Silva" <garsilva@embeddedor.com> writes:
>
>> The name of an array used by itself will always return the array's address.
>> So these tests will always evaluate as false and therefore the _return_
>> will never be executed.
>>
>> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
>
> I don't understand the commit log, especially what does "The name of an
> array used by itself" mean?
>

Let me correct that and I'll send the patch again.

Thanks!
--
Gustavo A. R. Silva







_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
