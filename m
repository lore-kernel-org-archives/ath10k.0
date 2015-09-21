Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-rs1-vallila2.fe.helsinki.fi ([128.214.173.75])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ze6Pg-0000zy-1j
 for ath10k@lists.infradead.org; Mon, 21 Sep 2015 19:06:09 +0000
Subject: Re: QCA6164 in Fedora
References: <55E8ED93.4040504@fedoraproject.org>
 <55F0D35F.9040704@fedoraproject.org> <55F0DBD9.4090505@fedoraproject.org>
 <CA+BoTQmcGxxeFTPBHSmRWmWjCXdnLG36XQ81xOywmhvk3OgJbA@mail.gmail.com>
From: Susi Lehtola <jussilehtola@fedoraproject.org>
Message-ID: <56005500.9030303@fedoraproject.org>
Date: Mon, 21 Sep 2015 12:05:36 -0700
MIME-Version: 1.0
In-Reply-To: <CA+BoTQmcGxxeFTPBHSmRWmWjCXdnLG36XQ81xOywmhvk3OgJbA@mail.gmail.com>
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

On 09/21/2015 12:18 AM, Michal Kazior wrote:
> On 10 September 2015 at 03:24, Susi Lehtola
> <jussilehtola@fedoraproject.org> wrote:
>> On 09/09/2015 05:48 PM, Susi Lehtola wrote:
>>>
>>> I can confirm the card works with the linux-next tree, using a snapshot
>>> I took today.
>>
>>
>> However, the card only seems to make a 1Mbps connection in the same
>> situation where my old laptop made a 55Mbps one...
>
> How did you measure this? `iw` tool reports invalid tx bitrate for
> ath10k due to firmware limitation. Did you test the actual performance
> (iperf/wget)? Is it downlink or uplink? Are both as bad?

This was the link speed reported by NetworkManager. But yes, actual 
performance is much better, seeing 2.2 MB/sec is not uncommon [the 
internet connection is pretty slow].
-- 
Susi Lehtola
Fedora Project Contributor
jussilehtola@fedoraproject.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
