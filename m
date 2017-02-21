Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from shards.monkeyblade.net ([184.105.139.130])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cgHYq-0001aS-CE
 for ath10k@lists.infradead.org; Tue, 21 Feb 2017 21:01:26 +0000
Date: Tue, 21 Feb 2017 16:01:03 -0500 (EST)
Message-Id: <20170221.160103.272609294929297575.davem@davemloft.net>
Subject: Re: ath10k regression on XPS13
From: David Miller <davem@davemloft.net>
In-Reply-To: <CA+55aFyqH3WAKsD_AaCe905zJbPzTXGygu2eiD1L0d6c2sAkGA@mail.gmail.com>
References: <87d1eb99dq.fsf_-_@purkki.adurom.net>
 <20170221.131858.949421414784612398.davem@davemloft.net>
 <CA+55aFyqH3WAKsD_AaCe905zJbPzTXGygu2eiD1L0d6c2sAkGA@mail.gmail.com>
Mime-Version: 1.0
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
To: torvalds@linux-foundation.org
Cc: ath10k@lists.infradead.org, jikos@kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kvalo@codeaurora.org

From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 21 Feb 2017 10:52:33 -0800

> On Tue, Feb 21, 2017 at 10:18 AM, David Miller <davem@davemloft.net> wrote:
>>
>> Kalle I really wanted to send my net-next pull request to Linus later
>> today.  But I guess I have to wait for this ath10k first.
> 
> Feel free to send it to me - it sounds like the regression is
>  (a) easy to work around
> and
>  (b) has a fix coming up.
> 
> And it won't even be something that I personally notice, since I have
> the prev-gen XPS13 that has intel wireless.

I have the revert in my tree, it's all good.

I'll let my tree sit quietly for a few hours then send a pull
request out later tonight.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
