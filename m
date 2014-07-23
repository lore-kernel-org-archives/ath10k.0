Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([79.140.42.25] helo=mail.mail.packetmixer.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9yEC-00037k-1U
 for ath10k@lists.infradead.org; Wed, 23 Jul 2014 15:13:12 +0000
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: Re: [PATCHv2 2/2] ath10k: add spectral scan feature
Date: Wed, 23 Jul 2014 17:12:43 +0200
References: <1405945943-8303-1-git-send-email-sw@simonwunderlich.de>
 <1405945943-8303-3-git-send-email-sw@simonwunderlich.de>
 <87zjg1tfjd.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87zjg1tfjd.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Message-Id: <201407231712.43500.sw@simonwunderlich.de>
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
Cc: mathias.kretschmer@fokus.fraunhofer.de, kgiori@qca.qualcomm.com, linux-wireless@vger.kernel.org, sven@narfation.org, ath10k@lists.infradead.org

Hey Kalle,

thanks for all the comments!

I'll make the changes as you suggested, although I'd like to point out that 
the "empty line before comment" and the "no indentation for WMI command 
parameters" things are not really consistent - there are also empty lines 
missing (e.g. struct wmi_start_scan_cmd) and indentation present (e.g. 
ath10k_wmi_peer_assoc and many others). Maybe that should be cleaned up at 
some point if you think that's important. :)

> > +struct fft_sample_ath10k {
> > +	struct fft_sample_tlv tlv;
> > +	u8 chan_width_mhz;
> > +	__be16 freq1;
> > +	__be16 freq2;
> > +	__be16 noise;
> > +	__be16 max_magnitude;
> > +	__be16 total_gain_db;
> > +	__be16 base_pwr_db;
> > +	__be64 tsf;
> > +	s8 max_index;
> > +	u8 rssi;
> > +	u8 relpwr_db;
> > +	u8 avgpwr_db;
> > +	u8 max_exp;
> > +
> > +	u8 data[0];
> > +} __packed;
> 
> __be16, that's a first. Just making sure that this really is big endian?

As the __le32 you use in other ath10k structs, this is just for checking - at 
least sparse should check that, maybe other tools as well.

I'll send a new patchset with the suggestions of Michal, Chun-Yeow and you 
soon. :)

Thanks!
    Simon

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
