Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wkuiw-0003j0-FO
 for ath10k@lists.infradead.org; Thu, 15 May 2014 12:25:22 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 1/2] ath10k: add implementation for configure max amsdu,
 ampdu
References: <1400151186-24949-1-git-send-email-janusz.dziedzic@tieto.com>
 <87egzv9te9.fsf@kamboji.qca.qualcomm.com>
 <CALhHN=o_KUjGWN4sEWaGxc3xKmXt2TdmcYsBT9O8rnixcv2q=A@mail.gmail.com>
Date: Thu, 15 May 2014 15:24:54 +0300
In-Reply-To: <CALhHN=o_KUjGWN4sEWaGxc3xKmXt2TdmcYsBT9O8rnixcv2q=A@mail.gmail.com>
 (Janusz Dziedzic's message of "Thu, 15 May 2014 13:35:49 +0200")
Message-ID: <871tvv9qll.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: while1eq1 <while1eq1@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, markaswift <markaswift@gmail.com>

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> On 15 May 2014 13:24, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
>> Did you somehow check that this command works as it should?
>
> Added WMI_DEBUG_EVENT in FW (_htt_tgt_tx_aggr_cfg):
>
> May 15 12:47:30 dell kernel: [ 6777.355444] ath10k: wmi event debug
> print 'xxx amsdu: 3, ampdu: 64' // This is default :)
> May 15 12:47:30 dell kernel: [ 6777.355477] ath10k: wmi event debug
> print 'xxx data: 0x00014005, 81925'
> May 15 12:47:30 dell kernel: [ 6777.355520] ath10k: wmi event debug
> print 'xxx amsdu: 1, ampdu: 64'

Ok, that's one way to test as well. I was more thinking about using
sniffer or another way to check what's really happening on the air.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
