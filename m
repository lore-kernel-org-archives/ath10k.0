Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOY4j-0003qG-Un
 for ath10k@lists.infradead.org; Wed, 27 Jan 2016 21:56:30 +0000
Message-ID: <56A93C56.5070205@codeaurora.org>
Date: Wed, 27 Jan 2016 13:53:26 -0800
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] ath10k: rename mesh and add abstraction layer
References: <1453920957-9908-1-git-send-email-poh@qca.qualcomm.com>
 <20160127193955.GC12639@localhost>
In-Reply-To: <20160127193955.GC12639@localhost>
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
To: Bob Copeland <me@bobcopeland.com>, Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org


On 01/27/2016 11:39 AM, Bob Copeland wrote:
> On Wed, Jan 27, 2016 at 10:55:53AM -0800, Peter Oh wrote:
>> Split Mesh service to 11s Mesh and non-11s Mesh according to
>> firmware service bit to help users distinguish 11s Mesh from
>> non 11s Mesh.
>> And add abstraction layer for vdev subtype to solve subtype mismatch
>> and to give flexible compatibility among different firmware revisions.
> Out of curiosity, which non-11s mesh, if you can share?
non-11s Mesh can be anything, but 11s Mesh such as meraki mesh.
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
