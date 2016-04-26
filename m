Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auzXz-0000rU-AH
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 09:44:47 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: QCA99XX with MU-MIMO and beamforming?
Date: Tue, 26 Apr 2016 09:44:03 +0000
Message-ID: <878u00zov2.fsf@kamboji.qca.qualcomm.com>
References: <571E7E8F.1010404@candelatech.com>
 <CA+BoTQke1auNL1-oPN-N9=e9K5vit0w2iJSS9KuXEifR7hqm6Q@mail.gmail.com>
In-Reply-To: <CA+BoTQke1auNL1-oPN-N9=e9K5vit0w2iJSS9KuXEifR7hqm6Q@mail.gmail.com>	(Michal
 Kazior's message of "Tue, 26 Apr 2016 08:16:06 +0200")
Content-Language: en-US
Content-ID: <899F1F441A895245B45C85063E426A64@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 25 April 2016 at 22:31, Ben Greear <greearb@candelatech.com> wrote:
>> Has anyone tried this?  Looks like hostapd has the ability to set the
>> feature flags, but I am not sure if it is really working in ath10k?
>
> Yes, it works. You need a few vht_capabs. I have mine like this:
>
>  > vht_capab=[RXLDPC][SHORT-GI-80][TX-STBC-2BY1][SU-BEAMFORMER][SU-BEAMFORMEE][MU-BEAMFORMER][RX-ANTENNA-PATTERN][TX-ANTENNA-PATTERN][BF-ANTENNA-4][MAX-MPDU-11454][RX-STBC-1][MAX-A-MPDU-LEN-EXP7]
>
> The SU-, MU- and BF- are the required part only I think.

If/when you have time, could you please mention something about this in
the wiki:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/configuration#hostapd

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
