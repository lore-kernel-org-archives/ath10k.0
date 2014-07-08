Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4Suy-0003pA-LA
 for ath10k@lists.infradead.org; Tue, 08 Jul 2014 10:46:37 +0000
Received: by mail-wg0-f41.google.com with SMTP id k14so3045145wgh.0
 for <ath10k@lists.infradead.org>; Tue, 08 Jul 2014 03:46:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <871tvv9qll.fsf@kamboji.qca.qualcomm.com>
References: <1400151186-24949-1-git-send-email-janusz.dziedzic@tieto.com>
 <87egzv9te9.fsf@kamboji.qca.qualcomm.com>
 <CALhHN=o_KUjGWN4sEWaGxc3xKmXt2TdmcYsBT9O8rnixcv2q=A@mail.gmail.com>
 <871tvv9qll.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 8 Jul 2014 12:46:09 +0200
Message-ID: <CACKGw+GGXjwVgcY-akTMT31uqG+a3wo+ghd5HUmQWe-1jjCL5Q@mail.gmail.com>
Subject: Re: [RFC 1/2] ath10k: add implementation for configure max amsdu,
 ampdu
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, while1eq1 <while1eq1@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 15 May 2014 14:24, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>
>> On 15 May 2014 13:24, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>>
>>> Did you somehow check that this command works as it should?
>>
>> Added WMI_DEBUG_EVENT in FW (_htt_tgt_tx_aggr_cfg):
>>
>> May 15 12:47:30 dell kernel: [ 6777.355444] ath10k: wmi event debug
>> print 'xxx amsdu: 3, ampdu: 64' // This is default :)
>> May 15 12:47:30 dell kernel: [ 6777.355477] ath10k: wmi event debug
>> print 'xxx data: 0x00014005, 81925'
>> May 15 12:47:30 dell kernel: [ 6777.355520] ath10k: wmi event debug
>> print 'xxx amsdu: 1, ampdu: 64'
>
> Ok, that's one way to test as well. I was more thinking about using
> sniffer or another way to check what's really happening on the air.

ok, so we have finally testing this (V2:
http://permalink.gmane.org/gmane.linux.kernel.wireless.general/124128)
today as it looks like the root issue may be similar to the macBook
IOT problem reported by Denton here:
http://lists.infradead.org/pipermail/ath10k/2014-July/002576.html

Anyway the commands are working fine and we can set the desired
aggregation settings.

-Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
