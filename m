Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBCwL-0007xY-L6
 for ath10k@lists.infradead.org; Tue, 02 Apr 2019 06:30:41 +0000
MIME-Version: 1.0
Date: Tue, 02 Apr 2019 12:00:29 +0530
From: Balaji Pothunoori <bpothuno@codeaurora.org>
Subject: Re: [PATCH v4 1/3] cfg80211: Add support to set tx power for a
 station associated
In-Reply-To: <20190401204611.GA8910@localhost>
References: <1553856501-21492-1-git-send-email-bpothuno@codeaurora.org>
 <20190401204611.GA8910@localhost>
Message-ID: <cd497042d164c322bc06c4cfbf26435a@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Bob Copeland <me@bobcopeland.com>
Cc: johannes@sipsolutions.net, Ashok Raj Nagarajan <arnagara@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2019-04-02 02:16, Bob Copeland wrote:
> Hi Balaji,
> 
> I started playing with these patches a bit -- they could be useful for
> my use case, but I had a question:
> 
>> + * @power: tx power (in dBm) to be used for sending data traffic. If 
>> tx power
>> + *	is not provided, the default per-interface tx power setting will 
>> be
>> + *	overriding. Driver should be picking up the lowest tx power, 
>> either tx
>> + *	power per-interface or per-station.
> 
> Should this really dBm?  It's a bit asymmetric for WIPHY_TX_POWER_LEVEL 
> to
> use mBm and this to use dBm, and I might want to adjust in half-dB 
> steps if
> supported by hardware.  Also allocating an s16 is a bit much for dBm.

if user will send mBm value then driver has to convert to dBm because 
firmware will expect the value in dBm.
Please refer johannes comments on following patch " [EXT] Re: [PATCH] 
iw: Add support for controlling tx power for per station"
for the reason why we opted dBm.

Yeah, s16 is required if units in mBm. i will modify to s8 in next 
version patch.

Regards,
Balaji.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
