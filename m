Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eL8s9-0005vC-OW
 for ath10k@lists.infradead.org; Sat, 02 Dec 2017 14:34:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [v3] ath10k: rebuild crypto header in rx data frames
Date: Sat, 2 Dec 2017 14:34:00 +0000
Message-ID: <878telw65j.fsf@kamboji.qca.qualcomm.com>
References: <1509035774-26553-1-git-send-email-kvalo@qca.qualcomm.com>
 <59b2ec22dc9c4db0bd30a65dba660b1c@euamsexm01a.eu.qualcomm.com>
 <154f13b8-1e77-dbe5-4cb0-81c534dbc40b@dd-wrt.com>
 <e98b52a7-ac14-81da-1fab-0c66befcf6d2@candelatech.com>
In-Reply-To: <e98b52a7-ac14-81da-1fab-0c66befcf6d2@candelatech.com> (Ben
 Greear's message of "Tue, 21 Nov 2017 10:54:03 -0800")
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

Ben Greear <greearb@candelatech.com> writes:

> Is this patch destined for stable?
>
> I was expecting to see it show up in the older stable releases,
> but it has not so far as far as I can tell.

We are working on it, but not sure yet to which releases, it doesn't
directly apply to all active stable releases.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
