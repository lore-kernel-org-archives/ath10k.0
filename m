Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3nDX-0005on-J8
 for ath10k@lists.infradead.org; Wed, 24 Dec 2014 14:47:16 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: num_rf_chains problem
References: <54987576.1010901@baanhofman.nl>
 <878uhyg5v9.fsf@kamboji.qca.qualcomm.com>
 <549AD03D.4070607@baanhofman.nl>
Date: Wed, 24 Dec 2014 16:46:44 +0200
In-Reply-To: <549AD03D.4070607@baanhofman.nl> (Wilco Baan Hofman's message of
 "Wed, 24 Dec 2014 15:39:57 +0100")
Message-ID: <87a92d9kbv.fsf@kamboji.qca.qualcomm.com>
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
To: Wilco Baan Hofman <wilco@baanhofman.nl>
Cc: ath10k@lists.infradead.org

Wilco Baan Hofman <wilco@baanhofman.nl> writes:

> On 23/12/14 08:52, Kalle Valo wrote:
>> Wilco Baan Hofman <wilco@baanhofman.nl> writes:
>>
>>> I'm currently setting up openwrt with the latest git ath10k on the
>>> Engenius ESR1750.
>>>
>>> A couple of things are off:
>>> - My chip shipped with regdomain code 0x00
>>> - OTP calibration is missing?
>>> - DFS pattern detector is not working, possibly because of OTP missing
>>> - num_rf_chains is reported as 2, which is wrong, it should be 3.
>> Most likely the calibration data is somewhere in the host flash (a small
>> MTD partion), there are already products which do that. The size of the
>> calibration data should be 2116 bytes.
>>
>> That would explain why the OTP in the chip itself is empty.
>
> Thanks! I have found a caldata MTD partition, but it contains quite a
> bit of data.. is there a signature I can check for the start (or end) of
> the calibration data?

The MAC address is something to search for and the board.bin file has
similar data format:

https://github.com/kvalo/ath10k-firmware/blob/master/ath10k/QCA988X/hw2.0/board.bin

Most likely the data starts from an even offset like 0x5000 or similar.
This was discussed before on this list, the archives might have more
hints.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
