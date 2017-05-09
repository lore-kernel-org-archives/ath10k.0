Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway33.websitewelcome.com ([192.185.146.78])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d84M8-0000te-Of
 for ath10k@lists.infradead.org; Tue, 09 May 2017 12:35:10 +0000
Received: from cm1.websitewelcome.com (cm.websitewelcome.com [192.185.0.102])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id 5FFB454F8B
 for <ath10k@lists.infradead.org>; Tue,  9 May 2017 07:34:44 -0500 (CDT)
Date: Tue, 09 May 2017 07:34:42 -0500
Message-ID: <20170509073442.Horde.Q8CbZi0XhNUcuRQ3NxtQfks@gator4166.hostgator.com>
From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: Re: [PATCH] net: wireless: ath: ath10k: remove unnecessary code
References: <20170509042159.GA19727@embeddedgus>
 <87lgq6387s.fsf@kamboji.qca.qualcomm.com>
 <76408651-07c6-fe31-863f-e1cb73b49663@broadcom.com>
In-Reply-To: <76408651-07c6-fe31-863f-e1cb73b49663@broadcom.com>
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
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: netdev@vger.kernel.org, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Hi Arend,

Quoting Arend Van Spriel <arend.vanspriel@broadcom.com>:

> On 9-5-2017 7:33, Kalle Valo wrote:
>> "Gustavo A. R. Silva" <garsilva@embeddedor.com> writes:
>>
>>> The name of an array used by itself will always return the array's address.
>>> So these tests will always evaluate as false and therefore the _return_
>>> will never be executed.
>>>
>>> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
>>
>> I don't understand the commit log, especially what does "The name of an
>> array used by itself" mean?
>
> The array fields in struct wmi_start_scan_arg that are checked here are
> fixed size arrays so they can never be NULL.
>
> Maybe that helps rephrasing this commit message.
>

Definitely. Thank you!
--
Gustavo A. R. Silva







_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
