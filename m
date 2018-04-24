Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAqU2-0005b1-7q
 for ath10k@lists.infradead.org; Tue, 24 Apr 2018 05:27:20 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: 9984 with 10.4.3.5.3-0057 crashes
References: <1523966821-21903-1-git-send-email-pillair@codeaurora.org>
 <1523966821-21903-5-git-send-email-pillair@codeaurora.org>
 <946e582c-2438-872b-eec8-25d9dcb994d9@dd-wrt.com>
 <7a06a34a5fcb97e07a8d79b4d689e781@codeaurora.org>
 <87604oodt4.fsf@kamboji.qca.qualcomm.com>
 <a7dd1b94951725c61034f5be6744b725@codeaurora.org>
 <8736zrjgq6.fsf@kamboji.qca.qualcomm.com>
 <c48c1bae-04c9-55d0-fdb9-d9ae8f7cb843@dd-wrt.com>
 <5AD9A1DF.6060007@broadcom.com>
 <87wowxdirv.fsf@kamboji.qca.qualcomm.com>
 <dafff879-3630-9596-bcb6-eaf07289318d@dd-wrt.com>
Date: Tue, 24 Apr 2018 08:27:02 +0300
In-Reply-To: <dafff879-3630-9596-bcb6-eaf07289318d@dd-wrt.com> (Sebastian
 Gottschall's message of "Mon, 23 Apr 2018 18:17:09 +0200")
Message-ID: <87k1sxcgyh.fsf@kamboji.qca.qualcomm.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: ath10k@lists.infradead.org

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> just for your notice. 10.4.3.5.3-0057 on 9984 which was just released
> crashes in vht160 operation mode immediatly after first station
> associates
> last known working stable fw so far is 10.4-3.4-00104. the whole
> 10.4.3.5.3 series seem to be seriously broken or the api has been
> changed in a way
> which is unsupported by ath10k (which i think is the cause of the problem)
> it would be good to know what has been changed.

At least I was not informed any changes in the firmware interface. What
version of ath10k are you using? Do you have any custom patches on
ath10k?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
