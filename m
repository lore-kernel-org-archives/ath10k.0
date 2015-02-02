Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIKkv-00045d-Nm
 for ath10k@lists.infradead.org; Mon, 02 Feb 2015 17:25:50 +0000
Message-ID: <54CFB2EC.5070307@codeaurora.org>
Date: Mon, 02 Feb 2015 09:25:00 -0800
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Replace ioread with wmb for data sync
References: <1422311118-11320-1-git-send-email-poh@qca.qualcomm.com>
 <20150127213349.GA24933@localhost> <54C824DC.5080804@qca.qualcomm.com>
 <20150128043005.GB24933@localhost> <54C875FD.3070101@qca.qualcomm.com>
 <1422430643.1973.1.camel@sipsolutions.net> <54CC0B71.9050301@codeaurora.org>
 <21708.11481.380046.994311@gargle.gargle.HOWL>
 <54CC3640.2090209@codeaurora.org>
 <21708.14493.458370.65799@gargle.gargle.HOWL>
In-Reply-To: <21708.14493.458370.65799@gargle.gargle.HOWL>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: Bob Copeland <me@bobcopeland.com>, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Peter Oh <poh@qca.qualcomm.com>


On 01/30/2015 06:06 PM, Sujith Manoharan wrote:
> Peter Oh wrote:
>> Please refer the email thread that I mentioned about other
> architectures.
>> (dsb is for ARM and other platforms have the equivalent instruction such
>> as sfence, sync, mf, and dcs).
> Ok.
>
>> Also the patch is updated with 2nd patch set replacing wmb to mb.
> Would be good to test this on a MIPS platform...
Agree. I'll do the investigation and test.
> Sujith
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
Thanks,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
