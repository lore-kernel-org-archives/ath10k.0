Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from vps.baanhofman.nl ([2001:41d0:52:300::107c])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3n79-0003et-K3
 for ath10k@lists.infradead.org; Wed, 24 Dec 2014 14:40:40 +0000
Message-ID: <549AD03D.4070607@baanhofman.nl>
Date: Wed, 24 Dec 2014 15:39:57 +0100
From: Wilco Baan Hofman <wilco@baanhofman.nl>
MIME-Version: 1.0
Subject: Re: num_rf_chains problem
References: <54987576.1010901@baanhofman.nl>
 <878uhyg5v9.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <878uhyg5v9.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

On 23/12/14 08:52, Kalle Valo wrote:
> Wilco Baan Hofman <wilco@baanhofman.nl> writes:
>
>> I'm currently setting up openwrt with the latest git ath10k on the
>> Engenius ESR1750.
>>
>> A couple of things are off:
>> - My chip shipped with regdomain code 0x00
>> - OTP calibration is missing?
>> - DFS pattern detector is not working, possibly because of OTP missing
>> - num_rf_chains is reported as 2, which is wrong, it should be 3.
> Most likely the calibration data is somewhere in the host flash (a small
> MTD partion), there are already products which do that. The size of the
> calibration data should be 2116 bytes.
>
> That would explain why the OTP in the chip itself is empty.
>
Thanks! I have found a caldata MTD partition, but it contains quite a
bit of data.. is there a signature I can check for the start (or end) of
the calibration data?

-- Wilco

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
