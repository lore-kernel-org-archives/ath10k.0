Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XHuMG-0005V6-9J
 for ath10k@lists.infradead.org; Thu, 14 Aug 2014 12:42:20 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: unregister spectral before mac
References: <1407856337-13067-1-git-send-email-sw@simonwunderlich.de>
 <87wqabmlc2.fsf@kamboji.qca.qualcomm.com> <9205567.prhmu1LLGe@prime>
Date: Thu, 14 Aug 2014 15:41:51 +0300
In-Reply-To: <9205567.prhmu1LLGe@prime> (Simon Wunderlich's message of "Thu,
 14 Aug 2014 14:22:04 +0200")
Message-ID: <87y4urkzu8.fsf@kamboji.qca.qualcomm.com>
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: ath10k@lists.infradead.org

Simon Wunderlich <sw@simonwunderlich.de> writes:

> On Thursday 14 August 2014 13:12:13 Kalle Valo wrote:
>> Simon Wunderlich <sw@simonwunderlich.de> writes:
>> > If spectral is unregistered after mac80211, the relayfs file has already
>> > been removed recursively by mac/cfg80211, and spectral tries to remove
>> > the file once more, thus leading to double free problems. Better clean
>> > up spectral before to avoid that problem.
>> > 
>> > Reported-by: Kalle Valo <kvalo@qca.qualcomm.com>
>> > Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
>> 
>> Thanks for checking this. But I'm just wondering why even bother to call
>> relay_close() in the first place if mac80211 recursively removes
>> everything anyway? We don't remove any of the debugfs files anyway.
>
> We need to relay_close() in any case because this function also causes to 
> clean up internal buffers of relayfs.
>
> An alternative to this patch could be to instead having 
> remove_buf_file_handler() call debugfs_remove() just do nothing and relay on 
> the upper layers to (recursively) remove that file - then, the relayfs stuff 
> still can get cleaned up. But that's also not very elegant either. If you 
> prefer that I can prepare a patch though ....

Yeah, that's not really any better. I'll apply your original patch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
