Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9zfM-0007ad-T1
 for ath10k@lists.infradead.org; Wed, 23 Jul 2014 16:45:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv2 2/2] ath10k: add spectral scan feature
References: <1405945943-8303-1-git-send-email-sw@simonwunderlich.de>
 <201407231712.43500.sw@simonwunderlich.de>
 <8738dst4o6.fsf@kamboji.qca.qualcomm.com>
 <201407231840.22674.sw@simonwunderlich.de>
Date: Wed, 23 Jul 2014 19:44:54 +0300
In-Reply-To: <201407231840.22674.sw@simonwunderlich.de> (Simon Wunderlich's
 message of "Wed, 23 Jul 2014 18:40:22 +0200")
Message-ID: <87y4vkrpmh.fsf@kamboji.qca.qualcomm.com>
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
Cc: mathias.kretschmer@fokus.fraunhofer.de, kgiori@qca.qualcomm.com, linux-wireless@vger.kernel.org, sven@narfation.org, ath10k@lists.infradead.org

Simon Wunderlich <sw@simonwunderlich.de> writes:

> Hey Kalle,
>
>> Simon Wunderlich <sw@simonwunderlich.de> writes:
>> >> > +struct fft_sample_ath10k {
>> >> > +	struct fft_sample_tlv tlv;
>> >> > +	u8 chan_width_mhz;
>> >> > +	__be16 freq1;
>> >> > +	__be16 freq2;
>> >> > +	__be16 noise;
>> >> > +	__be16 max_magnitude;
>> >> > +	__be16 total_gain_db;
>> >> > +	__be16 base_pwr_db;
>> >> > +	__be64 tsf;
>> >> > +	s8 max_index;
>> >> > +	u8 rssi;
>> >> > +	u8 relpwr_db;
>> >> > +	u8 avgpwr_db;
>> >> > +	u8 max_exp;
>> >> > +
>> >> > +	u8 data[0];
>> >> > +} __packed;
>> >> 
>> >> __be16, that's a first. Just making sure that this really is big endian?
>> > 
>> > As the __le32 you use in other ath10k structs, this is just for checking
>> > - at least sparse should check that, maybe other tools as well.
>> 
>> Sorry, I didn't understand your comment here. But basically I was asking
>> is the fft sample really in big endian? I assume it would be little
>> endian as everything else coming from the firmware.
>
> Yeah that is intended - we are also using big endian in ath9k to send fft 
> samples to userspace, because that is the network byte order and we then just 
> use ntohs() and friends in userspace to read samples from any system. 
> Therefore we intent to use the same encoding in ath10k. :)

Ah, this is the struct going to user space? I thought it's coming from
the firmware. Then forget my question :)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
