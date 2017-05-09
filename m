Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d848W-0005bA-2g
 for ath10k@lists.infradead.org; Tue, 09 May 2017 12:21:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] net: wireless: ath: ath10k: remove unnecessary code
Date: Tue, 9 May 2017 12:20:40 +0000
Message-ID: <87wp9qz0fd.fsf@kamboji.qca.qualcomm.com>
References: <20170509042159.GA19727@embeddedgus>
 <87lgq6387s.fsf@kamboji.qca.qualcomm.com>
 <76408651-07c6-fe31-863f-e1cb73b49663@broadcom.com>
In-Reply-To: <76408651-07c6-fe31-863f-e1cb73b49663@broadcom.com> (Arend Van
 Spriel's message of "Tue, 9 May 2017 14:07:57 +0200")
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
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Arend Van Spriel <arend.vanspriel@broadcom.com> writes:

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

Much much better, thanks!

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
