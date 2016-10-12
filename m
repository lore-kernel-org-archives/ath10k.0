Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buE5G-0005rB-Hd
 for ath10k@lists.infradead.org; Wed, 12 Oct 2016 07:36:15 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [v2,1/2] ath10k: clean up HTT tx buffer allocation and free
Date: Wed, 12 Oct 2016 07:35:43 +0000
Message-ID: <87zimaf29d.fsf@kamboji.qca.qualcomm.com>
References: <1475743188-12007-1-git-send-email-mohammed@qca.qualcomm.com>
 <c617b703956d4a038349494b87f65d0a@euamsexm01a.eu.qualcomm.com>
 <20161012070918.GA2993@atheros-ThinkPad-T61>
In-Reply-To: <20161012070918.GA2993@atheros-ThinkPad-T61> (Mohammed Shafi
 Shajakhan's message of "Wed, 12 Oct 2016 12:39:18 +0530")
Content-Language: en-US
Content-ID: <BB7772E17B939E4FB9F1D7E947C03B74@qualcomm.com>
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
To: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Mohammed Shafi Shajakhan <mohammed@codeaurora.org> writes:

> Hi Kalle,
>
> On Tue, Oct 11, 2016 at 01:36:22PM +0200, Kalle Valo wrote:
>> Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
>> > From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>> > 
>> > cleanup 'ath10k_htt_tx_alloc' by introducing the API's
>> > 'ath10k_htt_tx_alloc/free_{cont_txbuf, txdone_fifo} and
>> > re-use them whereever needed
>> > 
>> > Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>> 
>> Applies but fails to build:
>
> [shafi] sorry for the trouble again, I just figured out I had a private patch by
> mistake  and it worked for me, I will make sure that v3 is properly rebased
> without any errors.

Thanks. And no worries, I now have a script which does commit and build
tests semi-automatically and sends an email if it fails. Yay! This was a
good real life test for the script :)

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
