Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOevb-0006y4-Mq
 for ath10k@lists.infradead.org; Thu, 28 Jan 2016 05:15:33 +0000
Message-ID: <56A9A339.8040108@codeaurora.org>
Date: Wed, 27 Jan 2016 21:12:25 -0800
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] ath10k: rename mesh and add abstraction layer
References: <1453920957-9908-1-git-send-email-poh@qca.qualcomm.com>
 <20160127193955.GC12639@localhost> <56A93C56.5070205@codeaurora.org>
 <CAEFj984ULyZNa5YcLXZngrsYNT43WZCX5CHJLZ5msfHMmNABdg@mail.gmail.com>
In-Reply-To: <CAEFj984ULyZNa5YcLXZngrsYNT43WZCX5CHJLZ5msfHMmNABdg@mail.gmail.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: Bob Copeland <me@bobcopeland.com>, linux-wireless@vger.kernel.org, Peter Oh <poh@qca.qualcomm.com>, ath10k@lists.infradead.org


On 01/27/2016 06:04 PM, Yeoh Chun-Yeow wrote:
> On Thu, Jan 28, 2016 at 5:53 AM, Peter Oh <poh@codeaurora.org> wrote:
>> On 01/27/2016 11:39 AM, Bob Copeland wrote:
>>> On Wed, Jan 27, 2016 at 10:55:53AM -0800, Peter Oh wrote:
>>>> Split Mesh service to 11s Mesh and non-11s Mesh according to
>>>> firmware service bit to help users distinguish 11s Mesh from
>>>> non 11s Mesh.
>>>> And add abstraction layer for vdev subtype to solve subtype mismatch
>>>> and to give flexible compatibility among different firmware revisions.
>>> Out of curiosity, which non-11s mesh, if you can share?
>> non-11s Mesh can be anything, but 11s Mesh such as meraki mesh.
>>
> I thought that non-11s mesh is for meraki mesh since it is not 802.11s
> implementation.
>
> WMI_10_4_SERVICE_MESH_NON_11S for non IEEE802.11s Mesh
> WMI_SERVICE_MESH_11S and WMI_VDEV_SUBTYPE_MESH for IEEE 802.11s Mesh
>
> Correct me if I am wrong.
You're correct.  WMI_VDEV_SUBTYPE_MESH -> WMI_VDEV_SUBTYPE_MESH_11S
>
> Thanks
>
> ----
> Chun-Yeow
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
