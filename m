Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buJwT-0007pw-UA
 for ath10k@lists.infradead.org; Wed, 12 Oct 2016 13:51:35 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: QCA9887 Firmware Memory Usage
Date: Wed, 12 Oct 2016 13:51:08 +0000
Message-ID: <8760oxfzg4.fsf@kamboji.qca.qualcomm.com>
References: <CA+i30h8YsG7mce5FMwGw2fRNAn3USYV6K==QMjMQVeSGB0dj=w@mail.gmail.com>
In-Reply-To: <CA+i30h8YsG7mce5FMwGw2fRNAn3USYV6K==QMjMQVeSGB0dj=w@mail.gmail.com>	(David
 Hutchison's message of "Thu, 6 Oct 2016 15:59:40 -0600")
Content-Language: en-US
Content-ID: <D30CD3859F4F5847ACE2AD3659B3DC4E@qualcomm.com>
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
To: David Hutchison <dhutchison@bluemesh.net>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

David Hutchison <dhutchison@bluemesh.net> writes:

> I am using a Mikrotik hAP AC Lite which has a QCA9887 radio. It
> appears to be working; however ath10k ( or the qca9887 firmware ) is
> utilizing 15 - 20mb of memory. I applied the kfree(caldata) patch, to
> insure there is no memory leak.
>
> It doesn't appear to be leaking, and it will run Ok with the high
> memory footprint. However the Mikrotik hAP AC Lite is only a 64mb
> platform; so when I initialize the 2nd radio with ath9k I get OOMs.
>
> It just doesn't seem right that when ath10k + qca9887 is in AP mode
> that it's utilizing as much memory as it is. I don't think the issue
> is with ath10k, I think it's the qca9887 firmware (
> firmware-5.bin_10.2.4-1.0-00013 ).
>
> Is there a newer build available that may potentially fix these memory
> issues? The latest one available on
> https://github.com/kvalo/ath10k-firmware/blob/master/QCA9887/hw1.0/firmware-5.bin_10.2.4-1.0-00013
> is 2 months old. Perhaps there is a newer build to test that may have
> the fix?
>
> Any thoughts as to what it could be? I can provide more information if needed.

64MB of RAM nowadays is not much and ath10k is not really tested in such
setups AFAIK. I guess you could try if reducing TARGET_10X_NUM_MSDU_DESC
helps with the memory consumption, but no idea if that would even work
without further modifications to ath10k.

Also if you have fq-codel&co enabled that might increase memory
consumption. Adding linux-wireless as people there might have better
ideas.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
