Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-rs1-vallila2.fe.helsinki.fi ([128.214.173.75])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ze6aw-0006CX-GH
 for ath10k@lists.infradead.org; Mon, 21 Sep 2015 19:17:47 +0000
Subject: Re: QCA6164 in Fedora
References: <55E8ED93.4040504@fedoraproject.org>
 <55F0D35F.9040704@fedoraproject.org>
 <CA+BoTQkjDGAK4x0FfXoKeqgCuxGNEsD9wfOWnQE_C3f8kLKRTw@mail.gmail.com>
From: Susi Lehtola <jussilehtola@fedoraproject.org>
Message-ID: <560057BF.5070303@fedoraproject.org>
Date: Mon, 21 Sep 2015 12:17:19 -0700
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkjDGAK4x0FfXoKeqgCuxGNEsD9wfOWnQE_C3f8kLKRTw@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 09/21/2015 12:16 AM, Michal Kazior wrote:
> On 10 September 2015 at 02:48, Susi Lehtola
> <jussilehtola@fedoraproject.org> wrote:
>> The problem in the Fedora kernel is that the direct firmware load fails,
>> althoug the same firmware works with the linux-next tree.
>>
>> What would need to be backported to the 4.1 tree in order to get the card
>> working?
>
> You need to cherry-pick at least this patch:
> https://github.com/kvalo/ath/commit/36582e5d4daeccf68a8a3cef9bc37b60fb7d45b9
>
> The problem is qca6164 requires a different board.bin and will not
> work with one from qca6174. The driver uses the same firmware filepath
> for both. There's a per-pci-vid/pid board lookup but it's broken I
> would discourage using it until we come up with a better solution.

I tried that but it didn't work; the card was detected but the firmware 
failed to load. The patch I formed is at
https://bugzilla.redhat.com/attachment.cgi?id=1069561

The exact same firmware and board.bin works with the linux-next tree.

However, now that the development version of Fedora comes with kernel 
4.3, I can just recompile the package for my laptop. This problem should 
solve itself with time..
-- 
Susi Lehtola
Fedora Project Contributor
jussilehtola@fedoraproject.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
