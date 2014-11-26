Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtX3G-0000pd-Rx
 for ath10k@lists.infradead.org; Wed, 26 Nov 2014 07:30:15 +0000
From: "Natarajan, Vivekanandan" <nataraja@qti.qualcomm.com>
Subject: RE: [PATCH] ath10k: Do not limit RTS threshold value to 2347
Date: Wed, 26 Nov 2014 07:29:37 +0000
Message-ID: <6523f8d09c714868843b0927b8830a71@APHYDEXM01E.ap.qualcomm.com>
References: <1416830240-3019-1-git-send-email-nataraja@qti.qualcomm.com>,
 <54737A8C.40102@candelatech.com>
In-Reply-To: <54737A8C.40102@candelatech.com>
Content-Language: en-US
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
To: Ben Greear <greearb@candelatech.com>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

It works with the 10.2 firmware.

Moreover, the issue reported here was rts_threshold displayed in debugfs was different than the one that we had configured to the firmware(2347) .

Thanks
________________________________________
From: Ben Greear <greearb@candelatech.com>
Sent: Tuesday, November 25, 2014 12:05 AM
To: Natarajan, Vivekanandan
Cc: Valo, Kalle; ath10k@lists.infradead.org
Subject: Re: [PATCH] ath10k: Do not limit RTS threshold value to 2347

On 11/24/2014 03:57 AM, Vivek Natarajan wrote:
> Increase the rts threshold from the legacy value of 2347 to support higher
> threshold limit.

Does any firmware actually support RTS?  It didn't work last I tested
it on 10.1.

Thanks,
Ben

--
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
