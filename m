Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyjnQ-00049l-Fp
 for ath10k@lists.infradead.org; Tue, 17 Nov 2015 17:11:57 +0000
Subject: Re: TX-Power limits for ath10k based card on Linux 3.18.24 (long term
 support)?
References: <564B5004.7070103@candelatech.com>
 <403673121.6466400.1447779779000.JavaMail.yahoo@mail.yahoo.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <564B5FC3.60501@candelatech.com>
Date: Tue, 17 Nov 2015 09:11:31 -0800
MIME-Version: 1.0
In-Reply-To: <403673121.6466400.1447779779000.JavaMail.yahoo@mail.yahoo.com>
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
To: Joerg Pommnitz <pommnitz@yahoo.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 11/17/2015 09:02 AM, Joerg Pommnitz wrote:
> Ben,
> thanks for taking the time to answer. I followed your suggestion and repeated my tests
> with your beta-15 firmware.
> The results are interesting. At first I thought nothing had changed. The txpower was about 10dB,
>
> far short of the expected 20dB. Playing around with "iw dev ap set txpower fixed ... " did not result in significiant changes.
>
> However, when I add an attenuator between the powermeter and the antenna, the measured txpower markedly increased. With 10dB attenuation I get 12dB, with 20dB attenuation the txpower increases to more than 15dB.
>
> Question: Is this the expected behaviour? Can I force a fixed txpower instead of this dynamic adaptation?

I'm not aware of any logic in the firmware that would adjust power automatically
based on attenuation on the antenna connectors.

Any chance the issue is how you are measuring things?

Maybe try the same test with an ath9k NIC and see how it performs?

Do you see similar results with other firmware when you add attenuation?

Are you connecting just to channel 0 on the NIC, or are you connecting to
all three antenna ports?  With 11g, you should only see signal on the
first channel I think.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
