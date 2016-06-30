Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIa7y-0001aY-Hn
 for ath10k@lists.infradead.org; Thu, 30 Jun 2016 11:27:27 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: remove unused <linux/semaphore.h>
Date: Thu, 30 Jun 2016 11:26:22 +0000
Message-ID: <87inwq6hpe.fsf@kamboji.qca.qualcomm.com>
References: <20160621114539.15313-1-chaehyun.lim@gmail.com>
 <bf7b2008-b333-2d79-a952-fda895da8479@cogentembedded.com>
In-Reply-To: <bf7b2008-b333-2d79-a952-fda895da8479@cogentembedded.com> (Sergei
 Shtylyov's message of "Tue, 21 Jun 2016 16:46:00 +0300")
Content-Language: en-US
Content-ID: <3C0A1E261BB4E84384DEB906A6BC60C2@qualcomm.com>
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
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Chaehyun Lim <chaehyun.lim@gmail.com>

Sergei Shtylyov <sergei.shtylyov@cogentembedded.com> writes:

> On 6/21/2016 2:45 PM, Chaehyun Lim wrote:
>
>> <linux/semaphore.h> is not used anymore, so just remove it.
>
>    s/it/#include/?

Fixed that in the pending branch.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
